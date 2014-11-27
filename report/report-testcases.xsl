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
    <xsl:param name="test-location" select="'file:///D:/Projects/AbraSoft/__HG-ALL__/Exselt/W3.Tests/_Test-Repository/XT3/'" />
    
    <xsl:mode name="catalog" on-no-match="shallow-skip" />
    <xsl:mode name="test-set" on-no-match="shallow-skip" />
    <xsl:mode name="keywords" on-no-match="shallow-copy" />
    
    <xsl:variable name="test-catalog" select="resolve-uri('catalog.xml', $test-location)" />
    
    <xsl:template name="xsl:initial-template" match="/">
        <xsl:variable name="test-cases" as="element()*">
            <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
        </xsl:variable>
        
        <test-cases>
            <!-- names are unique, no need to check for dups -->
            <xsl:for-each select="$test-cases" >
                <xsl:sort />
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </test-cases>
    </xsl:template>
    
    <xsl:template match="test-set" mode="catalog">
        <xsl:apply-templates select="doc(resolve-uri(@file, $test-location))" mode="test-set" />
    </xsl:template>
    
    <xsl:template match="test-case" mode="test-set">
        <xsl:copy copy-namespaces="no">
            <xsl:value-of select="@name" />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>