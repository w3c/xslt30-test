<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:f="functions"
    exclude-result-prefixes="xs math f" version="3.0">

    <!-- 
        Author: Abel Braaksma
        Date: 2015-09-15
        generates tests, this is part of merging F# tests into the XSLT test format 
        
        NOTE: the resulting test-case set is deliberately not in the test-case namespace (to make copy/paste cleaner and easier)
    -->
    
    <xsl:output indent="yes" />
    
    <xsl:variable name="methods" select="'static', 'evaluate', 'apply-templates', 'stylesheet-function', 'tunneled'" />
    <xsl:variable name="ns-scope" select="'normal', 'other-default-namespace', 'switch-xsl-namespace'" />
    
    <!-- single quotes -->
    <xsl:variable name="q" static="yes" select="function($x) { '''' || $x || '''' } " />

    <xsl:template name="xsl:initial-template">
        <tests>
            <!-- xsl:product, xsl:vendor etc are ignored on purpose -->
            <xsl:apply-templates select="
                   'xsl:version',
                   'xsl:is-schema-aware',
                   'xsl:supports-serialization',
                   'xsl:supports-backwards-compatibility',
                   'xsl:supports-namespace-axis',
                   'xsl:supports-streaming',
                   'xsl:supports-dynamic-evaluation',
                   'xsl:xpath-version',
                   'xsl:xsd-version'"
            />
        </tests>
    </xsl:template>

    <xsl:template match=".[. = 'xsl:version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:copy-of select="f:create-helper(., ('3.0'), $num)" />
    </xsl:template>

    <xsl:template match=".[. = 'xsl:xpath-version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:copy-of select="f:create-helper(., ('3.0', '3.1'), $num)" />
    </xsl:template>
    
    <xsl:template match=".[. = 'xsl:xsd-version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:copy-of select="f:create-helper(., ('1.0', '1.1'), $num)" />
    </xsl:template>

    <xsl:template match=".">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:copy-of select="f:create-helper(., ('yes', 'no'), $num)" />
    </xsl:template>

    <xsl:function name="f:create-helper">
        <xsl:param name="property" />
        <xsl:param name="result" />
        <xsl:param name="propertyposition" />
        
        <xsl:for-each select="$methods">
            <xsl:variable name="m" select="." />
            <xsl:variable name="relpos" select="position()" />
            
            <xsl:for-each select="$ns-scope">
                <xsl:variable name="s" select="." />
                <xsl:variable name="letter" select="codepoints-to-string(($relpos - 1) * count($ns-scope) + position() + 96)" />
                
                <xsl:sequence select="f:create(
                    f:get-ns-corrected-property($property, $s), 
                    f:get-ns-corrected-result($result, $s), 
                    $m, 
                    $s, 
                    $propertyposition || $letter)" />
            </xsl:for-each>
        </xsl:for-each>        
    </xsl:function>
    
    <xsl:function name="f:get-ns-corrected-property">
        <xsl:param name="prop" />
        <xsl:param name="scope" />
        
        <xsl:sequence select="
            if($scope = 'switch-xsl-namespace') then replace($prop, 'xsl:', 'other:')
            else if($scope = 'other-default-namespace') then replace($prop, 'xsl:', '')
            else $prop" />
    </xsl:function>

    <xsl:function name="f:get-ns-corrected-result">
        <xsl:param name="result" />
        <xsl:param name="scope" />
        
        <xsl:sequence select="
            if($scope = 'switch-xsl-namespace') then $result
            else if($scope = 'other-default-namespace') then ''
            else $result" />
    </xsl:function>

    <!-- creator function that, well, creates the test-case -->
    <xsl:function name="f:create" expand-text="yes">
        <xsl:param name="property" />
        <xsl:param name="result" />
        <xsl:param name="method" />
        <xsl:param name="scope" />
        <xsl:param name="count" />
        
        <xsl:variable name="corrected-result" select="string-join($result ! $q(.), ', ')" />
        
        <xsl:value-of select="'&#xA;&#xA;'" />
        <test-case name="system-property-{$count}">
            <!-- wrong indent is here on purpose -->
            <description>
          System-property '{$property}' with method set to '{$method}', testing result = ({$corrected-result}) and ns-scope: '{$scope}'
          See for a more detailed description of the parameters and how this test works, the file system-property-100.xsl
      </description>
            <created by="Abel Braaksma" on="2015-09-30" />
            <dependencies>
                <spec value="XSLT30+" />
            </dependencies>
            <test>
                <stylesheet file="system-property-100.xsl" />
                <param static="yes" name="property" select="'{$property}'"/>
                <param static="yes" name="result" select="{$corrected-result (: already quoted :) }" />
                <param static="yes" name="method" select="'{$method}'" />
                <param static="yes" name="ns-scope" select="'{$scope}'"/>
            </test>
            <result>
                <all-of>
                    <assert>/output/@evaluation-method = '{$method}'</assert>
                    <assert>every $res in /output/global-variables/static-context/* satisfies $res = ({$corrected-result})</assert>
                    <assert>every $res in /output/global-variables/dynamic-context/* satisfies $res = ({$corrected-result})</assert>
                    <assert>every $eval in (for $i in 1 to 6 return /output/global-variables/static-context/*[$i] = /output/global-variables/dynamic-context/*[$i]) satisfies $eval</assert>
                    <assert>every $res in /output/static-context/result satisfies $res = ({$corrected-result})</assert>
                    <assert>every $res in /output/dynamic-context/result satisfies $res = ({$corrected-result})</assert>
                    <assert>every $res in /output/static-context/result-all/tokenize(., ' ') satisfies $res = ({$corrected-result})</assert>
                    <assert>every $res in /output/dynamic-context/result-all/tokenize(., ' ') satisfies $res = ({$corrected-result})</assert>
                </all-of>
            </result>
        </test-case>
    </xsl:function>
</xsl:stylesheet>
