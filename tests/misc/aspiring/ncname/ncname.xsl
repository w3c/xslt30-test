<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://myfunctions"
    exclude-result-prefixes="xs math f"
    version="3.0">
    
    <!-- this template creates an external parsed entity of all NCName characters -->
    <xsl:param name="mode" select=" 'dtd' " static="yes" />
    
    <xsl:output _method="{if($mode = 'dtd') then 'text' else 'xml'}" encoding="utf-8" byte-order-mark="true" />
    
    <xsl:template name="xsl:initial-template" match="/">
        <xsl:variable name="result">
            <xsl:apply-templates select="tokenize(
                '[#x41-#x5A] | [#x61-#x7A] | [#xC0-#xD6] | [#xD8-#xF6] | [#xF8-#x2FF] 
                | [#x370-#x37D] | [#x37F-#x1FFF] | [#x200C-#x200D]
                | [#x2070-#x218F] | [#x2C00-#x2FEF] | [#x3001-#xD7FF] 
                | [#xF900-#xFDCF] | [#xFDF0-#xFFFD] | [#x10000-#xEFFFF]',
                '\s*\|\s*') ! replace(., '\[|\]|#x', '')" _mode="{$mode}" />
        </xsl:variable>
        
        <xsl:comment select="$result" use-when="$mode = 'range' " />
        
        <NameStartChar xsl:use-when="$mode = 'entity' " >
            <xsl:value-of select="$result" separator="" />
        </NameStartChar>
        
        <xsl:for-each select="1 to 10" expand-text="yes">
            <xsl:choose>
                <xsl:when test="position() mod 2">
                    <xsl:value-of select=" 'foo-', position()" />
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        
        <xsl:value-of use-when="$mode = 'dtdd'">
            <xsl:copy-of select="unparsed-text('ncname-base.dtd')" />
            <xsl:value-of select="$result" separator="" />
        </xsl:value-of>
        
    </xsl:template>
    
    <xsl:template match=".[. instance of xs:string]" mode="range">
        <!-- set $mode := 'range' to test two ways of getting the range, for output in comment -->        
        <xsl:variable name="tok" select="let $ctx := . return function($n) { tokenize($ctx, '-')[$n] ! f:fromHex(.) }" />
        <xsl:variable name="from" select="tokenize(., '-')[1]" />
        <xsl:variable name="to" select="tokenize(., '-')[2]" />
        <xsl:value-of select="'&#xA;', $from ! f:fromHex(.), 'to', $to ! f:fromHex(.)" />
        <xsl:value-of select="', ', $tok(1), 'to', $tok(2)" />
    </xsl:template>
    
    <xsl:template match=".[. instance of xs:string]" mode="entity">
        <!-- actual output for the external parsed entity -->        
        <xsl:variable name="tok" select="let $ctx := . return function($n) { tokenize($ctx, '-')[$n] ! f:fromHex(.) }" />
        <xsl:for-each select="$tok(1) to $tok(2)">            
            <xsl:value-of select="codepoints-to-string(.), if(position() mod 10000 = 0) then '&#xA;' else ()" separator="" />
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match=".[. instance of xs:string]" mode="dtd" expand-text="yes">
        <!-- actual output for the external parsed entity -->        
        <xsl:variable name="tok" select="let $ctx := . return function($n) { tokenize($ctx, '-')[$n] ! f:fromHex(.) }" />
        <xsl:text>&#xA;&lt;-- Range {.}, position {position()}--></xsl:text>
        <xsl:text>&#xA;&lt;ENTITY ncname-{position()} "</xsl:text>
        <xsl:for-each select="$tok(1) to $tok(2)">
            <xsl:if test="position() mod 100 = 0">
                <xsl:variable name="pos" select="position()" />
                <xsl:text expand-text="yes">">&#xA;&lt;ENTITY ncname- "</xsl:text>
            </xsl:if>
            <xsl:value-of select="codepoints-to-string(.)" separator="" />
        </xsl:for-each>
        <xsl:text>">&#xA;&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:function name="f:fromHex" as="xs:integer">
        <xsl:param name="in" />
        <xsl:variable name="val" select="function($v) { if($v ge 65) then $v - 55 else $v - 48 }" />
        <xsl:sequence select="sum(reverse(string-to-codepoints($in)) ! ($val(.) * math:pow(16, position() - 1))) cast as xs:integer" />
    </xsl:function>
    
</xsl:stylesheet>