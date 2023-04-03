<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://exselt.net/local"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs math f"
    version="3.0">
    
    <xsl:import href="_report-package.xsl" />
    
    <xsl:output indent="yes"/>
    
    <xsl:mode name="get-xsl" on-no-match="shallow-skip" />
    
    <xsl:param name="query" select="'element-available'" />
    
    <xsl:template name="main">
        <test-xsl>
            <xsl:apply-templates select="doc($test-catalog)" mode="catalog" />
        </test-xsl>
    </xsl:template>
    
    <xsl:template match="test-set" mode="catalog" priority="10">
        <xsl:apply-templates select="doc(resolve-uri(@file, $test-location))" mode="test-set" />
    </xsl:template>
    
    <xsl:template match="document-node()" mode="xsl">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current" />
        </xsl:copy>    
    </xsl:template>
    
    <xsl:template match="xsl:transform | xsl:stylesheet" mode="xsl">
        <xsl:param name="initial-template-name" tunnel="yes" />
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <xsl:choose>
                <xsl:when test="$initial-template-name">
                    <xsl:apply-templates select="xsl:template[@name = $initial-template-name]" mode="#current" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="node()" mode="#current"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- =================== TEST SET PROCESSING ========================= -->
    
    <!-- tests with a <stylesheet> element -->
    <xsl:template match="test-case/test[stylesheet]" mode="test-set" priority="10">
        <xsl:variable name="xsl-doc" select="doc(resolve-uri(stylesheet[not(@role[. = 'secondary'])][1]/@file, base-uri(.)))" />
        <xsl:variable name="initial-template" select="initial-template/@name" />
        
        <!-- copy only the initial named template, or copy the whole stylesheet -->
        <xsl:apply-templates select="if($initial-template and $show-full-xslt eq 'false')
            then $xsl-doc//xsl:template[@name=$initial-template]
            else $xsl-doc" 
            mode="xsl">
            <xsl:with-param name="test-name" select="../@name" tunnel="yes" />
            <xsl:with-param name="xslt-location" select="$xsl-doc/base-uri()" tunnel="yes" />
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- tests without a <stylesheet> element, using an <environment ref="X"> instead -->
    <xsl:template match="test-case[environment]/test[not(stylesheet)]" mode="test-set" priority="10" use-when="false()">
        <xsl:variable name="env" select="/*/environment[@name = current()/../environment/@ref]" />
        <xsl:variable name="xsl-doc" select="doc(resolve-uri($env/stylesheet[not(@role[. = 'secondary'])][1]/@file, base-uri(.)))" />
        <xsl:variable name="initial-template" select="initial-template/@name" />
        
        <!-- copy only the initial named template, or copy the whole stylesheet -->
        <xsl:apply-templates select="if($initial-template and $show-full-xslt eq 'false')
            then $xsl-doc//xsl:template[@name=$initial-template]
            else $xsl-doc" 
            mode="xsl">
            <xsl:with-param name="test-name" select="../@name" tunnel="yes" />
            <xsl:with-param name="xslt-location" select="$xsl-doc/base-uri()" tunnel="yes" />
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="test-case" mode="test-set" priority="10">
        <test-case name="{@name}" test-set-name="{/*/@name}" catch-errors="{result/error/@code}">
            <xsl:copy-of select="f:get-all-stylesheets(.)"/>
        </test-case>
    </xsl:template>
    
    <!-- trying to *not* load XML 1.1 documents -->
    <xsl:template match="test-case[parent::test-set[dependencies[feature[@value = 'XML_1.1']]]]" mode="test-set" priority="20">
        <!-- do nothing -->
    </xsl:template>
    
    
    <xsl:function name="f:get-all-stylesheets">
        <xsl:param name="test-case" />
        <xsl:apply-templates select="$test-case/test/stylesheet" mode="get-xsl" />
    </xsl:function>
    
    <xsl:template match="environment" mode="get-xsl">
        <xsl:variable name="actual-env" select="/*/environment[@name = current()/@ref]" />
        <xsl:variable name="xsl-uris" select="$actual-env/stylesheet/@file!resolve-uri(., base-uri(.))" />
        <xsl:apply-templates select="$xsl-uris!doc(.)" mode="xsl">
            <xsl:with-param name="initial-template-name" select="../test/initial-template/@name" tunnel="yes" />
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="stylesheet" mode="get-xsl">
        <xsl:variable name="xsl-uri" select="resolve-uri(@file, base-uri(.))" />
        <xsl:apply-templates select="$xsl-uri!doc(.)" mode="xsl">
            <xsl:with-param name="initial-template-name" select="../initial-template/@name" tunnel="yes" />
        </xsl:apply-templates>
    </xsl:template>
</xsl:stylesheet>
