<xsl:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:f="http://myfunction"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0" xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all" expand-text="yes" 
    extension-element-prefixes="ixsl prop style">
    
    <xsl:param name="result-type" as="xs:string+"/>
    
    <xsl:variable name="results" as="element(result)*" xpath-default-namespace="" xmlns="">
        <result name="Saxon-9.8">/report/submission/Saxon_9.8.xml</result>
        <result name="Saxon-JS">/report/submission/Saxon-JS_1.0.xml</result>
        <result name="Parrot">/report/submission/Parrot_2017.xml</result>
    </xsl:variable>
    
    <xsl:template name="main">
        <xsl:message>Started...</xsl:message>
        <xsl:result-document href="#subtitle">
            for {ixsl:query-params()?product} (in category {ixsl:query-params()?category}) 
        </xsl:result-document>
        <xsl:message select="'Fetching: ', $results[@name=ixsl:query-params()?product]"/>
        <xsl:call-template name="handle-submission">
            <xsl:with-param name="submission-doc" select="doc($results[@name=ixsl:query-params()?product])"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="handle-submission">
        <xsl:param name="submission-doc"/>
        <xsl:message>In handle-submission... {count($submission-doc)}</xsl:message>
        <xsl:result-document href="#content" method="ixsl:replace-content">
          <ul>
            <xsl:for-each select="$submission-doc//*:test-set/*:test-case[@result=$result-type]
                                                        [f:isInCategory(../@name, @name, ixsl:query-params()?category)]">
                <li>
                  <a href="testcase.html?t={@name}&amp;s={../@name}">{@name}</a>
                  <xsl:if test="@comment">
                      ({@comment})  
                  </xsl:if>
                </li>
            </xsl:for-each>
          </ul>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:variable name="tests-doc" select="document('/report/tests-categories.xml')"/>
    
    <xsl:key name="test-cases" match="cat:test-case" use="@name"/>
    
    <xsl:function name="f:isInCategory" as="xs:boolean">
        <xsl:param name="test-set" as="xs:string"/>
        <xsl:param name="test-case" as="xs:string"/>
        <xsl:param name="category-code" as="xs:string"/>
        <xsl:sequence select="contains-token(key('test-cases', $test-case, $tests-doc)/@categories, $category-code)"/>
    </xsl:function>
    
</xsl:transform>
