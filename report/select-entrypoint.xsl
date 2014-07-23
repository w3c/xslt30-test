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
    
    <xsl:output indent="no" />
    
    <!-- provide a test location base-uri with a trailing slash -->
    <xsl:param name="test-location" select="'file:///d:/projects/w3.org/xt3/'" />
    <xsl:param name="test-set" select="'mode'" />
    <xsl:param name="test-case" select="'mode-0001'" />
    <xsl:param name="show-full-xslt" select="'true'" />
    <xsl:param name="is-saxon" select="system-property('xsl:vendor') = 'Saxonica'" static="yes" />
    
    <xsl:mode name="catalog" on-no-match="shallow-skip" />
    <xsl:mode name="test-set" on-no-match="shallow-skip" />
    <xsl:mode name="xsl" on-no-match="shallow-copy" />
    <xsl:mode name="keywords" on-no-match="shallow-skip" />
    
    <xsl:variable name="test-catalog" select="resolve-uri('catalog.xml', $test-location)" />
    
    <xsl:variable name="keyword-hints-input" select="resolve-uri('keyword-hints.xml', static-base-uri())" />
    
    <xsl:template match="/" use-when="$is-saxon">
        <xsl:call-template name="main" />
    </xsl:template>
    
    <xsl:template name="xsl:initial-template" use-when="not($is-saxon)">
        <xsl:call-template name="main" />
    </xsl:template>
    
    <xsl:template name="main">
        <xsl:text>&#xA;</xsl:text>
        
        <xsl:variable name="entrypoint">
            <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
        </xsl:variable>
        
        <result>
            <xsl:attribute name="keyword-hints" use-when="true()">
                <xsl:apply-templates select="document($keyword-hints-input)" mode="keywords">
                    <xsl:with-param name="entrypoint" select="$entrypoint" tunnel="yes" />
                </xsl:apply-templates>                
            </xsl:attribute>
            <xsl:text>&#xA;</xsl:text>
            <xsl:copy-of select="$entrypoint" />
        </result>
    </xsl:template>
    
    <xsl:template match="document-node()" mode="keywords" xpath-default-namespace="">
        <xsl:variable name="keyword-hints">
            <xsl:apply-templates select="*/hint[not(@active eq 'no')]" mode="#current" />        
        </xsl:variable>
        <xsl:variable name="filtered-keyword-hints">
            <xsl:apply-templates select="$keyword-hints/tokenize(., ' ')" mode="filter-keywords" >
                <xsl:with-param name="filter" select="*/filter" tunnel="yes" />
                <xsl:with-param name="all-keywords" select="$keyword-hints" tunnel="yes" />
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:value-of select="$filtered-keyword-hints" separator=" " />
    </xsl:template>
    
    <!-- removes keywords if a certain other keyword is already there -->
    <xsl:template match="." mode="filter-keywords" xpath-default-namespace="">
        <xsl:param name="filter" tunnel="yes" />
        <xsl:param name="all-keywords" tunnel="yes" />
        <xsl:variable name="if-keywords" select="$filter/if-keyword[. = $all-keywords/tokenize(., ' ')]" />
        <xsl:variable name="remove-keywords" select="$if-keywords/following-sibling::remove-keywords/tokenize(., ' ')" />
        <xsl:sequence select=".[not(. = $remove-keywords)]" />
    </xsl:template>

    
    <!-- find keyword hints based on keyword-hints.xml -->
    <xsl:template match="hint" mode="keywords" xpath-default-namespace="">
        <xsl:param name="entrypoint" required="yes" tunnel="yes" />
        <xsl:variable name="matches-xpath" as="xs:boolean">
            <xsl:evaluate xpath="'not(empty(' || xpath || '))'" context-item="$entrypoint" />
        </xsl:variable>

        <xsl:if test="$matches-xpath">
            <xsl:sequence select="keywords/text()/string()" />
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="hint[keywords[@as-xpath eq 'yes']]" mode="keywords" xpath-default-namespace="">
        <xsl:param name="entrypoint" required="yes" tunnel="yes" />
        <xsl:variable name="matches-xpath" as="xs:boolean">
            <xsl:evaluate xpath="'not(empty(' || xpath || '))'" context-item="$entrypoint" />
        </xsl:variable>
        
        <xsl:if test="$matches-xpath">
            <xsl:sequence>
                <xsl:evaluate xpath="keywords/text()" context-item="$entrypoint" />
            </xsl:sequence>
        </xsl:if>
    </xsl:template>
    
    
</xsl:stylesheet>