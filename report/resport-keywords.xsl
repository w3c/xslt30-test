<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://exselt.net/local"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs f math"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    version="3.0">
    
    <xsl:output indent="yes" />
    
    <!-- provide a test location base-uri with a trailing slash -->
    <xsl:param name="test-location" select="'file:///d:/projects/w3.org/xt3/'" />
    
    <xsl:mode name="catalog" on-no-match="shallow-skip" />
    <xsl:mode name="test-set" on-no-match="shallow-skip" />
    <xsl:mode name="keywords" on-no-match="shallow-copy" />
    
    <xsl:variable name="test-catalog" select="resolve-uri('catalog.xml', $test-location)" />
    
    <xsl:template name="xsl:initial-template" match="/">
        <xsl:variable name="keywords" as="element()*">
            <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
        </xsl:variable>
        <xsl:variable name="sorted-keywords" as="element()*">
            <xsl:apply-templates select="$keywords" mode="keywords">
                <xsl:sort />
            </xsl:apply-templates>
        </xsl:variable>
        
        <keywords>
            <xsl:for-each-group select="$sorted-keywords" group-adjacent="string(.)">
               <keyword>
                  <xsl:attribute name="count" select="count(current-group())" namespace=""/>
                  <xsl:attribute name="value" select="current-group()[1]/string(.)"  namespace=""/>
               </keyword>
            </xsl:for-each-group>
        </keywords>
    </xsl:template>
    
    <xsl:template match="test-set" mode="catalog">
        <xsl:apply-templates select="doc(resolve-uri(@file, $test-location))" mode="test-set" />
    </xsl:template>
    
    <xsl:template match="keywords" mode="test-set">
        <xsl:apply-templates select="tokenize(., ' ')" mode="#current" />
    </xsl:template>
    
    <xsl:template match=".[. instance of xs:string]" mode="test-set">
        <keyword><xsl:value-of select="." /></keyword>
    </xsl:template>
    
</xsl:stylesheet>