<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://exselt.net/local"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs f math"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    version="3.0">
    
    <xsl:import href="_report-package.xsl" />
    
    <!-- indentation is mimicked from the source documents -->
    <xsl:output indent="no" />
    
    <!-- provide a test location base-uri with a trailing slash -->
    <xsl:param name="test-set" select="'sf-insert-before'" />
    <xsl:param name="test-case" select="'sf-insert-before-001'" />
    <xsl:param name="show-full-xslt" select="'false'" />
    
    <xsl:template name="main">
        <xsl:text>&#xA;</xsl:text>
        
        <xsl:variable name="entrypoint" select="f:get-entry-point()" />
        
        <result>
            <xsl:copy-of select="f:keyword-hints($entrypoint)" />
            <xsl:text>&#xA;</xsl:text>
            <xsl:copy-of select="$entrypoint" />
        </result>
    </xsl:template>
    
    
</xsl:stylesheet>