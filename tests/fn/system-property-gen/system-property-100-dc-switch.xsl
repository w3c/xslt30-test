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
    use-when="$ns-switch">
    
    <xsl:output indent="yes" />
    
   
    <!--
        DC: switch
        TODO: should we test static variables inside dynamic variables? Currently it is dyn calling dyn only
    -->

    <!-- function calls in static context and their results -->
    <other:variable name="dc:static-call" _select="{$v:static-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:ref-call" _select="{$v:ref-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:let-call"  _select="{$v:let-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:anon-call"  _select="{$v:anon-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:partial-call" _select="{$v:partial-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:lookup-call"  _select="{$v:lookup-call}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    
    <!-- variables set to function items in static context, and their evaluations -->
    <other:variable name="dc:ref-ref" _select="{$v:function-ref}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:ref-ref-result" _select="$dc:ref-ref{$d:paren-args}"  
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    
    <other:variable name="dc:partial-ref" _select="{$v:function-partial}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:partial-ref-result"  _select="$dc:partial-ref{$d:paren-args}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <other:variable name="dc:lookup-ref" _select="{$v:function-lookup}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:lookup-ref-result" _select="$dc:lookup-ref{$d:paren-args}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <other:variable name="dc:anon-ref" _select="function({$d:anon-args}) {{ $dc:ref-ref({$d:anon-args}) }}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:anon-ref-result" _select="$dc:anon-ref{$d:paren-args}" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>

    <!-- sequence of function references -->
    <other:variable name="dc:anon-ref-all" select="function() { $dc:lookup-ref, $dc:partial-ref, $dc:ref-ref, $dc:anon-ref }" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
    <other:variable name="dc:anon-ref-all-result" _select="if(every $res in ( $dc:anon-ref-all() ! .{$d:paren-args} ) satisfies $res = $result) then $result else 'wrong-anon-ref-all-result'" 
         xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
         xmlns:other="http://www.w3.org/1999/XSL/Transform"/>
     
</xsl:stylesheet>