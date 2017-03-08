<xsl:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:f="http://myfunction"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0" xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all" expand-text="yes" 
    extension-element-prefixes="ixsl prop style">

    <!-- Type of result to be processed -->
    <xsl:param name="result-type" as="xs:string+"/>
    
    <!-- Should be not reported tests listed? -->
    <xsl:param name="notReported" as="xs:boolean" select="false()"/>
    
    <!-- Locations of submission files -->
    <xsl:variable name="results" as="element(result)*" xpath-default-namespace="" xmlns="">
        <result name="Exselt">../submission/exselt.xml</result>
        <result name="Saxon-9.8">../submission/Saxon_9.8.xml</result>
        <result name="Saxon-JS">../submission/Saxon-JS_1.0.xml</result>
        <result name="Parrot">../submission/Parrot_2017.xml</result>
    </xsl:variable>
    
    <xsl:variable name="category-names" as="map(xs:string, xs:string)" select='map{
        "BC" : "Basic Conformance",
        "STRM" : "Streaming",
        "SA" : "Schema-Aware",
        "XP10" : "Backwards Compatibility",
        "XP31" : "XPath 3.1",
        "HOF" : "Higher-Order Functions",
        "SER" : "Serialization",
        "EVAL" : "Dynamic Evaluation"
        }'/>
    
    <!-- Easy access to query parameters -->
    <xsl:variable name="category" select="ixsl:query-params()?category"/>
    
    <xsl:template name="main">
        <xsl:message>Started...</xsl:message>
        <xsl:result-document href="#subtitle">
            for {ixsl:query-params()?product} (in category {$category-names($category)}) 
        </xsl:result-document>
        <xsl:message>Fetching tests and their categories...</xsl:message>
        <ixsl:schedule-action document="{resolve-uri('../tests-categories.xml', ixsl:location())}">
            <xsl:call-template name="load-aux-data"/>
        </ixsl:schedule-action>
    </xsl:template>

    <xsl:template name="load-aux-data">
        <xsl:variable name="tests-doc" select="doc(resolve-uri('../tests-categories.xml', ixsl:location()))"/>
        <xsl:message select="'Fetching: ', $results[@name=ixsl:query-params()?product]"/>
        <ixsl:schedule-action document="{resolve-uri($results[@name=ixsl:query-params()?product], ixsl:location())}">
            <xsl:call-template name="handle-submission">
                <xsl:with-param name="submission-doc" select="doc(resolve-uri($results[@name=ixsl:query-params()?product], ixsl:location()))"/>
                <xsl:with-param name="tests-doc" select="$tests-doc"/>
            </xsl:call-template>
        </ixsl:schedule-action>
    </xsl:template>

    <xsl:template name="handle-submission">
        <xsl:param name="submission-doc"/>
        <xsl:param name="tests-doc"/>
        <xsl:message>Processing submission...</xsl:message>
        <xsl:result-document href="#content" method="ixsl:replace-content">
          <ul>
            <xsl:for-each select="$submission-doc/*:test-suite-result/*:test-set/*:test-case[@result=$result-type]
                                                        [f:isInCategory($tests-doc, @name, $category)]">
                <li>
                  <a href="testcase.html?t={@name}&amp;s={../@name}" target="testcase">{@name}</a>
                  <xsl:if test="@comment">
                      ({@comment})  
                  </xsl:if>
                </li>
            </xsl:for-each>
          </ul>
          <xsl:if test="$notReported">
              <xsl:variable name="runned-test" select="$submission-doc/*:test-suite-result/*:test-set/*:test-case/string(@name)"/>
              <xsl:variable name="not-reported" select="$tests-doc/*/*:test-set/*:test-case[contains-token(@categories, $category)][not(@name = $runned-test)]"/>
              <xsl:if test="exists($not-reported)">
                  <h3>Not reported tests</h3>
                  <ul>
                      <xsl:for-each select="$not-reported">
                          <li>
                              <a href="testcase.html?t={@name}&amp;s={../@name}">{@name}</a>
                          </li>
                      </xsl:for-each>
                  </ul>
              </xsl:if>
          </xsl:if>
          
        </xsl:result-document>
    </xsl:template>
    
    <xsl:key name="test-cases" match="cat:test-case" use="@name"/>
    
    <xsl:function name="f:isInCategory" as="xs:boolean">
        <xsl:param name="tests-doc" as="document-node()"/>
        <xsl:param name="test-case" as="xs:string"/>
        <xsl:param name="category-code" as="xs:string"/>
        <xsl:sequence select="contains-token(key('test-cases', $test-case, $tests-doc)/@categories, $category-code)"/>
    </xsl:function>
    
</xsl:transform>
