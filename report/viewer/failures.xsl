<xsl:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:f="http://myfunction"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0" xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all" expand-text="yes" 
    extension-element-prefixes="ixsl prop style">
    
    <xsl:variable name="results" as="element(result)*" xpath-default-namespace="" xmlns="">
        <result name="Saxon-9.8">/report/submission/Saxon_9.8.xml</result>
        <result name="Saxon-JS">/report/submission/Saxon-JS_1.0.xml</result>
        <result name="Parrot">/report/submission/Parrot_2017.xml</result>
    </xsl:variable>
    
    <xsl:function name="f:dependencies" as="element(*)*" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog" >
        <xsl:param name="test" as="element(test-case)"/>
        <xsl:sequence select="$test/(dependencies|../dependencies)/*"/>
    </xsl:function>
    
    <xsl:function name="f:non-spec-dependencies" as="element(*)*" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog">
        <xsl:param name="test" as="element(test-case)"/>
        <xsl:sequence select="$test/(dependencies|../dependencies)/*[not(self::spec)]"/>
    </xsl:function>
    
    <xsl:function name="f:is30" as="xs:boolean" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog">
        <xsl:param name="test" as="element(test-case)"/>
        <xsl:sequence select="not(f:dependencies($test)[self::spec]/@value[not(f:allows30(.))])"/>
    </xsl:function>
    
    <xsl:function name="f:allows30" as="xs:boolean" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog">
        <xsl:param name="spec" as="xs:string"/>
        <xsl:sequence select="tokenize($spec) = ('XSLT10+', 'XSLT20+', 'XSLT30', 'XSLT30+')"/>
    </xsl:function>


    <xsl:template name="main">
        <xsl:message>Started...</xsl:message>
        <xsl:result-document href="#title">
            Test Case Failures for {ixsl:query-params()?product} (in category {ixsl:query-params()?category}) 
        </xsl:result-document>
        <xsl:message select="'Fetching: ', $results[@name=ixsl:query-params()?product]"/>
        <xsl:call-template name="handle-submission">
            <xsl:with-param name="submission-doc" select="doc($results[@name=ixsl:query-params()?product])"/>
        </xsl:call-template>
        <!--<ixsl:schedule-action document="{resolve-uri(//cat:test-set[@name=ixsl:query-params()?s]/@file, base-uri(.))}">
            <xsl:call-template name="handle-test-set"/>
        </ixsl:schedule-action>-->
    </xsl:template>
    
    <xsl:template name="handle-submission">
        <xsl:param name="submission-doc"/>
        <xsl:message>In handle-submission... {count($submission-doc)}</xsl:message>
        <xsl:result-document href="#content">
            <ul>
                <xsl:for-each select="$submission-doc//*:test-case[@result='fail'][f:isInCategory(../@name, @name, ixsl:query-params()?category)]">
                    <li><a href="testcase.html?t={@name}&amp;s={../@name}">{@name}</a></li>
                </xsl:for-each>
            </ul>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:function name="f:isInCategory" as="xs:boolean">
        <xsl:param name="test-set" as="xs:string"/>
        <xsl:param name="test-case" as="xs:string"/>
        <xsl:param name="category-code" as="xs:string"/>
        <xsl:variable name="catalog-doc" select="document('/catalog.xml')"/>
        <xsl:variable name="test-set-doc" select="document($catalog-doc//cat:test-set[@name=$test-set]/@file)"/>
        <xsl:variable name="test-case-element" select="$test-set-doc//cat:test-case[@name=$test-case]"/>
        <xsl:choose>
            <xsl:when test="$category-code = 'BC'">
                <xsl:sequence select="f:is30($test-case-element) and empty(f:non-spec-dependencies($test-case-element))"/>
            </xsl:when>
            <xsl:when test="$category-code = 'STRM'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'streaming')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'SA'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'schema_aware')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'SER'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'serialization')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'XP10'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'backwards_compatibility')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'EVAL'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'dynamic_evaluation')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'XP31'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'XPath_3.1')"/>
            </xsl:when>
            <xsl:when test="$category-code = 'HOF'">
                <xsl:sequence select="f:has-dependency($test-case-element, 'higher_order_functions')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="f:has-dependency" as="xs:boolean" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog">
        <xsl:param name="testcase" as="element()"/>
        <xsl:param name="feature" as="xs:string"/>
        <xsl:sequence select="f:is30($testcase) and
            exists(f:non-spec-dependencies($testcase)[self::feature[@value = $feature and not(@satisfied = 'false')]]) and
            empty(f:non-spec-dependencies($testcase)[not(self::feature[@value = $feature])])"/>
    </xsl:function>
    
 




</xsl:transform>
