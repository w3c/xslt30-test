<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xpath="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://w3c-tests"
    xmlns:data="urn:data"
    xmlns:v="urn:value-or-strings"
    xmlns:sc="urn:static-context-functions-and-results"
    xmlns:dc="urn:dynamic-context-functions-and-results"
    xmlns:d="urn:data-variable"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    
    <xsl:output indent="yes" />
    

    <!--
        Set of helper function items
    -->
    
    <!-- escapes single quotes -->
    <xsl:variable name="e" static="yes" select="replace(?, '''', '''''')" />
    
    <!-- single quotes around argument -->
    <xsl:variable name="q" static="yes" select="function($x) { '''' || $x || '''' } " />
    
    <!-- parens around argument -->
    <xsl:variable name="p" static="yes" select="function($x) { '(' || $x || ')' } " />
    
    <xsl:variable name="r" static="yes" select="function($x) { '(' || string-join(($x ! $q(.)), ', ') || ')' } " />

    <!-- $wrap takes a sequence and creates a string with each argument surrounded by parentheses, separated by commas, and the whole surrounded by parentheses -->
    <xsl:variable name="wrap" static="yes" select="function($x) { $p ( string-join($x ! ($p(.)), ',' ) ) } " />
    
    <xsl:variable name="ns-normal" static="yes" select="$ns-scope = 'normal'"  as="xs:boolean" />
    <xsl:variable name="ns-switch" static="yes" select="$ns-scope = 'switch-xsl-namespace'"  as="xs:boolean" />
    <xsl:variable name="ns-other" static="yes" select="$ns-scope = 'other-default-namespace'"  as="xs:boolean" />
    <!--xsl:variable name="prefixes" static="yes" select="'', 'xpath:', 'Q{http://www.w3.org/2005/xpath-functions}'" /-->
    <!--xsl:variable name="apply" static="yes" select="function($f, $arg) { '(' || string-join($prefixes ! concat(., $f, ($arg ! ('(' || . || ')'), '#1')[1]), ', ') || ')' }" /-->
    <xsl:variable name="qname-from-eqname" static="yes" select="function($s) { if(contains($s, '}')) then substring-after($s, '}') else $s } " />
    
    <!-- data -->
    <xsl:variable name="d:data" static="yes" select="doc('system-property-100-data.xml')/data:test" as="element()"/> 
    <xsl:variable name="d:method" static="yes" select="$d:data/data:method[@type/tokenize(., ' ') = $method]" as="element()"/>
    <xsl:variable name="d:function-name" static="yes" select="$prefix || $d:data/data:function/@name" as="xs:string"/>
    <xsl:variable name="d:function-ns" static="yes" select="$d:data/data:function/@ns" as="xs:string"/>
    <xsl:variable name="d:arg-count" static="yes" select="$d:data/data:function/@arguments" as="xs:integer"/>
    <xsl:variable name="d:eval-static" static="yes" select="$d:data/data:function/@allowed-in-static eq 'yes'" as="xs:boolean" />
    <xsl:variable name="d:eval-direct-error" static="yes" select="$d:method/@eval-direct-error" as="xs:string*" />
    <xsl:variable name="d:eval-ref-error" static="yes" select="$d:method/@eval-ref-error" as="xs:string*" />
    <xsl:variable name="d:args" static="yes" select="$d:method/data:arg ! string(.)" as="xs:string*" />
    <xsl:variable name="d:eval-args" static="yes" _select="{$wrap($d:args)}" />
    <xsl:variable name="d:paren-args" static="yes" select="$wrap($d:eval-args)" />
    <xsl:variable name="d:anon-args" static="yes" select="string-join((1 to $d:arg-count) ! ('$' || codepoints-to-string(. + 96)), ', ')" />
    
    <!-- values, i.e. strings of XPath expressions for function calls to be used later -->
    <xsl:variable name="v:function-ref" static="yes" select="$d:function-name || '#' || $d:arg-count" as="xs:string"/>
    <xsl:variable name="v:function-partial" static="yes" select="$d:function-name || $p((1 to $d:arg-count) ! '?')" as="xs:string"/>    
    <xsl:variable name="v:function-lookup" static="yes" select="'function-lookup(QName(' || $q($d:function-ns) || ', ' || $q($qname-from-eqname($d:function-name)) || '), ' || string($d:arg-count) || ')'" as="xs:string"/>
    <xsl:variable name="v:static-call" static="yes" select="$d:function-name || $d:paren-args" as="xs:string" />
    <xsl:variable name="v:function-anon" static="yes" select="'function() { ' || $v:static-call || ' }'" as="xs:string"/>
    <xsl:variable name="v:ref-call" static="yes" select="$v:function-ref || $d:paren-args" as="xs:string"/>
    <xsl:variable name="v:let-call" static="yes" select="'let $f := ' || $v:function-ref || ' return $f' || $d:paren-args" as="xs:string"/>
    <xsl:variable name="v:anon-call" static="yes" select="$v:function-anon || '()'" as="xs:string"/>
    <xsl:variable name="v:partial-call" static="yes" select="$v:function-partial || $d:paren-args" as="xs:string"/>
    <xsl:variable name="v:lookup-call" static="yes" select="'let $f := ' || $v:function-lookup || ' return (if($f instance of function(*)) then $f' || $d:paren-args || ' else ())'" as="xs:string"/>


</xsl:stylesheet>