<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    
    <xsl:import href="../run-tests.xsl"/>
    
    <xsl:variable name="satisfied-dependencies" as="element(*)*">
        <c:spec value="XSLT20 XSLT30"/>
        <c:year_component_values value="support negative year" satisfied="true"/>
        <c:year_component_values value="support year above 9999" satisfied="true"/>
        <c:default_language_for_numbering value="en" satisifed="true"/>
        <c:default_output_encoding value="UTF-8" satisfied="true"/>
        <c:combinations_for_numbering value="*" satisfied="true"/>
        <c:feature value="backwards_compatibility" satisfied="true"/>
        <c:feature value="built_in_derived_types" satisfied="true"/>
        <c:feature value="dtd" satisfied="true"/>
        <c:feature value="disabling_output_escaping" satisfied="true"/>
        <c:feature value="dynamic_evaluation" satisfied="true"/>
        <c:feature value="higher_order_functions" satisfied="true"/>
        <c:feature value="namespace_axis" satisfied="true"/>
        <c:feature value="schema_aware" satisfied="true"/> 
        <c:feature value="serialization" satisfied="true"/>
        <c:feature value="streaming" satisfied="true"/>
        <c:feature value="XML_1.1" satisfied="true"/>
        <c:feature value="XPath_3.1" satisfied="true"/>
        <c:feature value="XSD_1.1" satisfied="true"/>
        <!--<c:feature value="xsl-stylesheet-processing-instruction" satisfied="false"/>-->
    </xsl:variable>
    
    <xsl:variable name="exceptions" as="element(test-case)*">
        <test-case name="copy-3802" reason="Saxon 9.9 bug"/>
        <test-case name="document-1101" reason="Saxon 9.9 bug"/>
        <test-case name="error-0045a" reason="Saxon 9.9 bug"/>
        <test-case name="error-0045b" reason="Saxon 9.9 bug"/>
        <test-case name="error-0045ba" reason="Saxon 9.9 bug"/>
        <test-case name="initial-mode-002" reason="Saxon 9.9 bug"/>
        <test-case name="mode-1702a" reason="Saxon 9.9 bug"/>
        <test-case name="mode-1705a" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-0204" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-0303" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-0304" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1401" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1402" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1404" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1405" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1406" reason="Saxon 9.9 bug"/>
        <test-case name="result-document-1407" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-052" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-088" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-089" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-090" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-105" reason="Saxon 9.9 bug"/>
        <test-case name="si-fork-815" reason="Saxon 9.9 bug"/>
        <test-case name="si-group-051" reason="Saxon 9.9 bug"/>
        <test-case name="sf-sum-044" reason="Saxon 9.9 bug"/>
        <test-case name="sf-sum-045" reason="Saxon 9.9 bug"/>
        <test-case name="sx-arithmetic-001" reason="Saxon 9.9 bug"/>
        <test-case name="sx-arithmetic-002" reason="Saxon 9.9 bug"/>
        <test-case name="use-package-291" reason="Saxon 9.9 bug"/>
        <test-case name="use-package-292" reason="Saxon 9.9 bug"/>
        <test-case name="use-package-293" reason="Saxon 9.9 bug"/>
        <test-case name="use-package-294" reason="Saxon 9.9 bug"/>
    </xsl:variable>
    
    <!-- Establish whether a test needs to run in its own configuration. This is needed mainly
        (a) when the test needs access to a package library, and (b) when it uses a no-namespace
        schema -->

    <xsl:variable name="tests-needing-a-new-configuration" as="xs:string*"
        select="'validation-0201', 'validation-0202', 'validation-0203', 'validation-0204', 'validation-0205', 
        'validation-0206', 'validation-0207', 'validation-0208', 'validation-0213', 'validation-0215', '', 
        'validation-1101','validation-1201','validation-2001','validation-2002',
        'si-copy-109', 'si-copy-of-107', 'si-copy-of-109', 'si-document-101', 'si-result-document-101', 'si-element-101', 'si-LRE-101'"/>
    
    <xsl:function name="c:needs-new-configuration" as="xs:boolean">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:variable name="env" select="c:get-environment($test)"/>
        <xsl:choose>
            <xsl:when test="($test/c:test | $env)/c:package[@role='secondary']">
                <xsl:sequence select="true()"/>
            </xsl:when>
            <xsl:when test="$tests-needing-a-new-configuration = $test/@name">
                <xsl:sequence select="true()"/>
            </xsl:when>
            <!--<xsl:when test="$env/c:schema[string(@uri)='']">
                <xsl:sequence select="true()"/>
            </xsl:when>-->
            <xsl:otherwise>
                <xsl:sequence select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="c:transform" as="map(*)">       
        <xsl:param name="options" as="map(*)"/>
        <xsl:param name="test-case" as="element(c:test-case)"/>
        <xsl:variable name="env" select="c:get-environment($test-case)"/>
        
        <xsl:message>Needs new config: {c:needs-new-configuration($test-case)}</xsl:message>
        <xsl:choose>
            <xsl:when test="c:needs-new-configuration($test-case)">
                <xsl:variable name="config">
                    <configuration xmlns="http://saxon.sf.net/ns/configuration" edition="EE">
                        <xsd multipleSchemaImports="true"/>
                        <resources>
                            <xsl:for-each select="c:get-environment($test-case)/c:schema">
                                <schemaDocument>
                                    <xsl:value-of select="resolve-uri(@file, base-uri(.))"/>
                                </schemaDocument>
                            </xsl:for-each>
                        </resources>
                        <xsltPackages>
                            <xsl:for-each select="($test-case/c:test | c:get-environment($test-case))/c:package[@role='secondary']">
                                <package sourceLocation="{resolve-uri(@file, base-uri(.))}"/>
                            </xsl:for-each>
                        </xsltPackages>                       
                    </configuration>
                </xsl:variable>
                
                <xsl:variable name="options2" select="c:inner-put($options, 'vendor-options', QName('http://saxon.sf.net/', 'configuration'), $config)"/>            
                <xsl:message>(using new Configuration)</xsl:message>
                <xsl:sequence select="transform($options2)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="transform($options)"/>
            </xsl:otherwise>
        </xsl:choose>
        

        
    </xsl:function>
    
    <xsl:function name="c:handle-special-initial-mode">
        <xsl:param name="mode-name"/>
        <xsl:choose>
            <xsl:when test="$mode-name = '#unnamed'">
                <xsl:map-entry key="'initial-mode'" select="QName('http://www.w3.org/1999/XSL/Transform', 'unnamed')"/>
            </xsl:when>
            <xsl:when test="$mode-name = '#default'">
                <xsl:map-entry key="'initial-mode'" select="QName('http://www.w3.org/1999/XSL/Transform', 'default')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes">Cannot handle initial-mode="{$mode-name}"</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- Override template rules to process source docouments that require streaming and/or validation. 
        The difficulty here is that the standard fn:transform() interface provides no way of requesting streaming or 
        validation. Saxon's implementation therefore extends the interface to allow the option source-location to be
        supplied as an alternative to source-node, and to request that the principal source document is
        validated. The validation is done by the fn:transform function itself, not by the caller, 
        so that it can use the schema of the target configuration rather than the caller's configuration -->
    
    <xsl:template match="c:source[@role='.'][@file][@validation or @streaming='true']" mode="get-source-documents" priority="11">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="opt2" select="map:put($options, 'source-location', resolve-uri(@file, base-uri(.)))"/>
        <xsl:variable name="opt3" select="if (@validation) then c:request-validation(., $opt2) else $opt2"/>
        <xsl:sequence select="$opt3"/>
    </xsl:template>
    
    <xsl:template match="c:source[@role='.'][c:content][@validation='strict']" mode="get-source-documents" priority="13">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="tree" select="parse-xml(string(c:content))"/>
        <xsl:variable name="opt2" select="map:put($options, 'source-node', $tree)"/>
        <xsl:variable name="opt3" select="if (@validation) then c:request-validation(., $opt2) else $opt2"/>
        <xsl:sequence select="$opt3"/>
    </xsl:template>
    
    <xsl:function name="c:request-validation" as="map(xs:string, item()*)">
        <xsl:param name="source" as="element(c:source)"/>
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:sequence select="c:inner-put($options, 'vendor-options', QName('http://saxon.sf.net/', 'schema-validation'), string($source/@validation))"/>
    </xsl:function>
    
</xsl:stylesheet>