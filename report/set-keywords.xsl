<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://exselt.net/local"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs f math"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    version="3.0">
    
    <xsl:output indent="no" cdata-section-elements="content assert-xml" />
    
    <!-- provide a test location base-uri with a trailing slash -->
    <xsl:param name="test-location" select="'file:///d:/projects/w3.org/xt3/'" />
    <xsl:param name="test-set" select="'as'" />
    <xsl:param name="test-case" select="'as-0114'" />
    <xsl:param name="test-keywords" select="'testttt'" />
    

    <xsl:param name="is-saxon" select="system-property('xsl:vendor') = 'Saxonica'" static="yes" />
    
    <xsl:mode name="catalog" on-no-match="shallow-skip" />
    <xsl:mode name="test-set" on-no-match="shallow-copy" />
    
    <xsl:variable name="test-catalog" select="resolve-uri('catalog.xml', $test-location)" />
    
    <xsl:template match="/" use-when="$is-saxon">
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
    </xsl:template>
    
    <xsl:template name="xsl:initial-template" use-when="not($is-saxon)">
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
    </xsl:template>
    
    <xsl:template match="test-set[@name = $test-set]" mode="catalog">        
        <xsl:apply-templates select="doc(resolve-uri(@file, $test-location))" mode="test-set" />
    </xsl:template>
    
    <!-- missing keyword, insert <keywords> after <description> and leave indentation intact -->
    <xsl:template match="test-case[@name = $test-case][not(keywords)]" mode="test-set">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current" />
            <!-- non-element nodes before <description> -->
            <xsl:apply-templates select="node()[current()/description >> .]" mode="#current" />
            <xsl:apply-templates select="description" mode="#current" />
            <!-- non-element nodes after description but before the next element -->
            <xsl:apply-templates select="description/following-sibling::node()[current()/description/following-sibling::*[1] >> .]" mode="#current" />
            
            <!-- BUG in Saxon (I think), it copies the xs-namespace into <keywords> ... -->
            <keywords><xsl:value-of select="$test-keywords" /></keywords>
            
            <!-- copy text node for LF and indentation -->
            <xsl:copy-of select="text()[1]" />
            
            <!-- everything after <description> element -->
            <xsl:apply-templates select="text()[2]/following-sibling::node()" mode="#current" />
        </xsl:copy>
    </xsl:template>
    
    <!-- test-case with keywords, just update the keywords -->
    <xsl:template match="test-case[@name = $test-case]/keywords" mode="test-set">
        <xsl:copy>
            <xsl:value-of select="$test-keywords" />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>