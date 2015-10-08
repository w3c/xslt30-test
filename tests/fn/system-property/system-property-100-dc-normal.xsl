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
    use-when="$ns-normal">
    
    <xsl:output indent="yes" />
    
    
    <!--
        DC: normal
        TODO: should we test static variables inside dynamic variables? Currently it is dyn calling dyn only
    -->

    <!-- function calls in static context, in a dynamic global var, and their results -->
    <xsl:variable name="dc:static-call"     _select="{$v:static-call}"/>
    <xsl:variable name="dc:ref-call"        _select="{$v:ref-call}"/>
    <xsl:variable name="dc:let-call"        _select="{$v:let-call}"/>
    <xsl:variable name="dc:anon-call"       _select="{$v:anon-call}"/>
    <xsl:variable name="dc:partial-call"    _select="{$v:partial-call}"/>
    <xsl:variable name="dc:lookup-call"     _select="{$v:lookup-call}"/>
    
    <!-- variables set to function items in static context, and their evaluations -->
    <xsl:variable name="dc:ref-ref"             _select="{$v:function-ref}"/>
    <xsl:variable name="dc:ref-ref-result"      _select="$dc:ref-ref{$d:paren-args}"/>
    
    <xsl:variable name="dc:partial-ref"         _select="{$v:function-partial}"/>
    <xsl:variable name="dc:partial-ref-result"  _select="$dc:partial-ref{$d:paren-args}"/>

    <xsl:variable name="dc:lookup-ref"          _select="{$v:function-lookup}"/>
    <xsl:variable name="dc:lookup-ref-result"   _select="$dc:lookup-ref{$d:paren-args}"/>

    <xsl:variable name="dc:anon-ref"            _select="function({$d:anon-args}) {{ $dc:ref-ref({$d:anon-args}) }}"/>
    <xsl:variable name="dc:anon-ref-result"     _select="$dc:anon-ref{$d:paren-args}"/>

    <!-- sequence of function references -->
    <xsl:variable name="dc:anon-ref-all"        select="function() { $dc:lookup-ref, $dc:partial-ref, $dc:ref-ref, $dc:anon-ref }"/>
    <xsl:variable name="dc:anon-ref-all-result" _select="if(every $res in ( $dc:anon-ref-all() ! .{$d:paren-args} ) satisfies $res = $result) then $result else 'wrong-anon-ref-all-result'"/>


    
</xsl:stylesheet>