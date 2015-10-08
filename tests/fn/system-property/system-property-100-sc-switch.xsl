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
    use-when="$d:eval-static and $ns-switch">
    
    <xsl:output indent="yes" />
    
   
    <!--
        SC: switch-xsl-namespace
    -->
    
    <!-- function calls in static context and their results -->
    <other:variable name="sc:static-call" static="yes" _select="{$v:static-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:ref-call" static="yes" _select="{$v:ref-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:let-call" static="yes" _select="{$v:let-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:anon-call" static="yes" _select="{$v:anon-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:partial-call" static="yes" _select="{$v:partial-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:lookup-call" static="yes" _select="{$v:lookup-call}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    
    <!-- variables set to function items in static context, and their evaluations -->
    <other:variable name="sc:ref-ref" static="yes" _select="{$v:function-ref}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:ref-ref-result" static="yes" _select="$sc:ref-ref{$d:paren-args}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    
    <other:variable name="sc:partial-ref" static="yes" _select="{$v:function-partial}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:partial-ref-result" static="yes" _select="$sc:partial-ref{$d:paren-args}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <other:variable name="sc:lookup-ref" static="yes" _select="{$v:function-lookup}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:lookup-ref-result" static="yes" _select="$sc:lookup-ref{$d:paren-args}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <other:variable name="sc:anon-ref" static="yes" _select="function({$d:anon-args}) {{ $sc:ref-ref({$d:anon-args}) }}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:anon-ref-result" static="yes" _select="$sc:anon-ref{$d:paren-args}"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <!-- sequence of function references -->
    <other:variable name="sc:anon-ref-all" static="yes" select="function() { $sc:lookup-ref, $sc:partial-ref, $sc:ref-ref, $sc:anon-ref }"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="sc:anon-ref-all-result" static="yes" _select="if(every $res in ( $sc:anon-ref-all() ! .{$d:paren-args} ) satisfies $res = $result) then $result else 'wrong-anon-ref-all-result'"
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    


</xsl:stylesheet>