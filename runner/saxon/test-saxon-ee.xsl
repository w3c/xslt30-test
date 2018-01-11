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
    
    <xsl:function name="c:transform" as="map(*)">       
        <xsl:param name="options" as="map(*)"/>
        <xsl:param name="test-case" as="element(c:test-case)"/>
        
        <!-- Circumvention for Saxon bug 3607 -->
        <xsl:variable name="options" select="if (empty(($options?source-node, $options?initial-template, $options?initial-function)))
            then map:put($options, 'initial-template', QName('http://www.w3.org/1999/XSL/Transform', 'initial-template'))
            else $options"/>
        
        <!-- Add details of secondary packages -->
        <xsl:variable name="use-packages" select="($test-case/c:test | c:get-environment($test-case))/c:package[@role='secondary'] "/> 
        <xsl:variable name="options" select="if (exists($use-packages))
            then let $vendor-options := ($options?vendor-options, map{})[1],
                     $new-vendor-options := map:put($vendor-options, 'package-library', $use-packages ! resolve-uri(@file, base-uri(.)))
                 return map:put($options, 'vendor-options', $new-vendor-options)    
            else $options"/>
        
        <xsl:sequence select="transform($options)"/>
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
    
</xsl:stylesheet>