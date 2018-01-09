<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    
    <xsl:import href="../run-tests.xsl"/>
    
    <xsl:variable name="dependencies" as="element(*)*">
        <c:spec value="XSLT20 XSLT30"/>
        <c:year_component_values value="support negative year" satisfied="true"/>
        <c:year_component_values value="support year above 9999" satisfied="true"/>
        <c:feature value="built_in_derived_types" satisfied="true"/>
        <c:feature value="schema_aware" satisfied="false"/> <!-- TODO: schema-aware tests -->
        <c:feature value="XPath_3.1" satisfied="true"/>
        <c:feature value="schema_aware" satisfied="true"/>
        <c:feature value="streaming" satisfied="true"/>
    </xsl:variable>
    
    <xsl:variable name="exceptions" as="element(test-case)*">
        <test-case name="copy-3802" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-088" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-089" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-090" reason="Saxon 9.9 bug"/>
        <test-case name="streamable-105" reason="Saxon 9.9 bug"/>
        <test-case name="si-group-051" reason="Saxon 9.9 bug"/>
    </xsl:variable>
    
    <xsl:function name="c:transform" as="map(*)">
        <!-- Circumvention for Saxon bug 3607 -->
        <xsl:param name="options" as="map(*)"/>
        <xsl:sequence select="if (empty(($options?source-node, $options?initial-template, $options?initial-function)))
            then transform(map:merge(($options, map{'initial-template': QName('http://www.w3.org/1999/XSL/Transform', 'initial-template')}))) 
            else transform($options)"/>
    </xsl:function>
    
</xsl:stylesheet>