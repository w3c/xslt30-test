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
    
    <xsl:variable name="methods" select="'static', 'dynamic', 'no-namespace', 'eqname', 'wrong-namespace', 'other-namespace-prefix', 'qname'" />
    
    <!-- single quotes -->
    <xsl:variable name="q" static="yes" select="function($x) { '''' || $x || '''' } " />

    <xsl:template name="xsl:initial-template">
        <tests>
            <!-- xsl:product, xsl:vendor etc are ignored on purpose -->
            <xsl:apply-templates select="
                   '',
                   'egpe.xml',
                   'dtd-only.xml',
                   'unfinished.xml',
                   'plaintext.txt',
                   'non-existing.xml'"
            />
        </tests>
    </xsl:template>

    <xsl:template match=".[. = 'xsl:version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:copy-of select="$methods ! (f:create(current(), '3.0', ., $num || codepoints-to-string(position() + 96)))" />
    </xsl:template>

    <xsl:template match=".[. = 'xsl:xpath-version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:copy-of select="$methods ! (f:create(current(), ('3.0', '3.1'), ., $num || codepoints-to-string(position() + 96)))" />
    </xsl:template>

    <xsl:template match=".[. = 'xsl:xsd-version']">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:copy-of select="$methods ! (f:create(current(), ('1.0', '1.1'), ., $num || codepoints-to-string(position() + 96)))" />
    </xsl:template>

    <xsl:template match=".">
        <xsl:variable name="num" select="'10' || position()" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:copy-of select="$methods ! (f:create(current(), ('yes', 'no'), ., $num || codepoints-to-string(position() + 96)))" />
    </xsl:template>

    <!-- creator function that, well, creates the test-case -->
    <xsl:function name="f:create" expand-text="yes">
        <xsl:param name="property" />
        <xsl:param name="result" />
        <xsl:param name="method" />
        <xsl:param name="count" />
        
        <xsl:variable name="corrected-result" select="
            if($method = ('no-namespace', 'wrong-namespace')) then '''''' 
            else if($method = 'qname') then '''irrelevant-raises-error'''
            else string-join($result ! $q(.), ', ')" />
        
        <xsl:variable name="xpath-for-testresult" as="xs:string+">
            <xsl:sequence select="
                let $or-empty := if($corrected-result = '''''') then '''empty''' else $corrected-result
                return
                    if($method = 'qname') then ('''fail''', (1 to 4) ! '''exception''')
                    else if($method = 'dynamic') then ('''fail''', '''exception''','''exception''',  $or-empty, '''exception''')
                    else ('''success''', (1 to 4) ! $or-empty)" />
        </xsl:variable>
        
        <xsl:value-of select="'&#xA;&#xA;'" />
        <test-case name="stream-available-{$count}">
            <!-- wrong indent is here on purpose -->
            <description>
          Stream-available '{$property}' with a '{$method}' context, testing result = '{$corrected-result}'
          See for a more detailed description of the parameters and how this test works, the file stream-available-100.xsl
      </description>
            <created by="Abel Braaksma" on="2015-09-30" />
            <dependencies>
                <spec value="XSLT30+" />
            </dependencies>
            <test>
                <stylesheet file="stream-available-100.xsl" />
                <param static="yes" name="property" select="'{$property}'" />
                <param static="yes" name="result" select="{$corrected-result (: already quoted :) }" />
                <param static="yes" name="method" select="'{$method}'" />
            </test>
            <result>
                <all-of>
                    <assert>/result/@total = {$xpath-for-testresult[1]}</assert>
                    <xsl:for-each select="$xpath-for-testresult[position() > 1]">
                        <xsl:variable name="call" select="let $p := position() return ('staticcall', 'letcall', 'dyncall', 'anoncall')[$p]" />
                        <assert>/result/{$call}/@result/tokenize(., ' ') = ({.})</assert>                    
                    </xsl:for-each>
                </all-of>
            </result>
        </test-case>
    </xsl:function>
</xsl:stylesheet>
