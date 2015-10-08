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
    version="3.0"
    use-when="$d:eval-static and $ns-other">
    
    
    <xsl:output indent="yes" />
    
    <!--
        SC: other-default-namespace
    -->
    
    <!-- function calls in static context and their results -->
    <xsl:variable name="sc:static-call"     static="yes" _select="{$v:static-call}"/>
    <xsl:variable name="sc:ref-call"        static="yes" _select="{$v:ref-call}"/>
    <xsl:variable name="sc:let-call"        static="yes" _select="{$v:let-call}"/>
    <xsl:variable name="sc:anon-call"       static="yes" _select="{$v:anon-call}"/>
    <xsl:variable name="sc:partial-call"    static="yes" _select="{$v:partial-call}"/>
    <xsl:variable name="sc:lookup-call"     static="yes" _select="{$v:lookup-call}"/>
    
    <!-- variables set to function items in static context, and their evaluations -->
    <xsl:variable name="sc:ref-ref"             static="yes" _select="{$v:function-ref}"/>
    <xsl:variable name="sc:ref-ref-result"      static="yes" _select="$sc:ref-ref{$d:paren-args}"/>
    
    <xsl:variable name="sc:partial-ref"         static="yes" _select="{$v:function-partial}"/>
    <xsl:variable name="sc:partial-ref-result"  static="yes" _select="$sc:partial-ref{$d:paren-args}"/>

    <xsl:variable name="sc:lookup-ref"          static="yes" _select="{$v:function-lookup}"/>
    <xsl:variable name="sc:lookup-ref-result"   static="yes" _select="$sc:lookup-ref{$d:paren-args}"/>

    <xsl:variable name="sc:anon-ref"            static="yes" _select="function({$d:anon-args}) {{ $sc:ref-ref({$d:anon-args}) }}"/>
    <xsl:variable name="sc:anon-ref-result"     static="yes" _select="$sc:anon-ref{$d:paren-args}"/>

    <!-- sequence of function references -->
    <xsl:variable name="sc:anon-ref-all"        static="yes" select="function() { $sc:lookup-ref, $sc:partial-ref, $sc:ref-ref, $sc:anon-ref }"/>
    <xsl:variable name="sc:anon-ref-all-result" static="yes" _select="if(every $res in ( $sc:anon-ref-all() ! .{$d:paren-args} ) satisfies $res = $result) then $result else 'wrong-anon-ref-all-result'"/>
   

</xsl:stylesheet>