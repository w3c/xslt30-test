<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://exselt.net/local"
    exclude-result-prefixes="xs math f"
    version="3.0">
    
    <xsl:import href="_report-package.xsl" />
    
    <xsl:output indent="yes"/>
    
    <xsl:mode name="get-xsl" on-no-match="shallow-skip" />
    <xsl:mode name="search" on-no-match="shallow-skip" />
    <xsl:mode name="search-elements" on-no-match="shallow-skip" />
    
    <xsl:param name="query" select="'xsl:sort'" />
    <xsl:param name="search-elements" select="true()" as="xs:boolean"/>
    <xsl:param name="search-attributes" select="false()" as="xs:boolean"/>
    <xsl:variable name="all-xsl" select="resolve-uri('all-test-xsl.xml', resolve-uri('report/', $test-location))" />
    
    <xsl:template name="main">
        <search-results>
           <xsl:if test="$search-attributes or $search-elements">
               <xsl:apply-templates select="doc($all-xsl)" mode="search" />
           </xsl:if>
        </search-results>
    </xsl:template>
    
    <xsl:template match="*" mode="search">
        <xsl:if test="$search-elements and name() eq $query">
            <xsl:variable name="test-name" select="ancestor::test-case/@name" />
            <xsl:variable name="test-set"  select="ancestor::test-case/@test-set-name" />
            <found test-name="{$test-name}" test-set="{$test-set}" />
        </xsl:if>
        <xsl:apply-templates select="
            if($search-attributes) 
            then @*[contains(., $query) or name() = $query]
            else ()" mode="#current" />
        <xsl:apply-templates select="*" mode="#current" />
    </xsl:template>
    
    <xsl:template match="attribute()" mode="search">
        <xsl:variable name="test-name" select="ancestor::test-case/@name" />
        <xsl:variable name="test-set"  select="ancestor::test-case/@test-set-name" />
        <found test-name="{$test-name}" test-set="{$test-set}" />
    </xsl:template>
    

</xsl:stylesheet>