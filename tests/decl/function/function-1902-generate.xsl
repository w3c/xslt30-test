<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- 
         creates: function-1902.xml (list of functions of F&O 3.0 that are NOT in F&O 2.0 or in XSLT 2.0
         generates a list of functions of F&O 3.0 that are NOT in the F&O 2.0 spec, for XSLT 2.0-only processors, who should not recognize these functions
         TODO: (ABr 2015-03-30) this generator was updated and needs to be verified (Bug 20843)
         
         Modified (2015-03-30, ABr) fixed path, added XSLT 2.0 functions to be excluded
    -->
    
    <xsl:mode on-no-match="shallow-skip" />
    <xsl:output indent="true" />
    
    <xsl:variable name="location20">../../../specs/functions-and-operators-rec20.xml</xsl:variable>
    <xsl:variable name="location30">../../../specs/functions-and-operators-rec30.xml</xsl:variable>
    <xsl:variable name="locationXslt20">../../../specs/xslt-rec20.xml</xsl:variable>
    
    <xsl:template name="xsl:initial-template">
        <xsl:variable name="fo20">
            <function-list>
                <xsl:apply-templates select="doc($location20)/html[1]/body[1]//code[@class='function']" />
            </function-list>
        </xsl:variable>
        <xsl:variable name="fo30">
            <function-list>
                <xsl:apply-templates select="doc($location30)/html[1]/body[1]//code[@class='function']" />
            </function-list>
        </xsl:variable>
        <xsl:variable name="xslt20">
            <function-list>
                <xsl:apply-templates select="doc($locationXslt20)/html[1]/body[1]//code[@class='function']" mode="xslt20" />
            </function-list>
        </xsl:variable>
        
        <!-- 
            Go over the FO30 functions and remove those that are inside XSLT20 or FO20 function lists.
            Result is a list of functions that only contains the functions that were added in FO30
        -->
        <xsl:result-document href="function-1902.xml" xpath-default-namespace="">
            <function-list>
                <xsl:copy-of select="$fo30/function-list/function
                    [let $f := . return not($fo20/function-list/function[@name = $f/@name and @arity = $f/@arity])]
                    [let $f := . return not($xslt20/function-list/function[@name = $f/@name and @arity = $f/@arity])]" />
            </function-list>
        </xsl:result-document>
    </xsl:template>
    
    
    <!-- xslt 2.0 functions, some functions were moved to FO30, they were supported of course in XSLT20 -->
    <xsl:template match="code" mode="xslt20">
        
        <function 
            name="fn:{. (: prefixed with 'fn' for ease of comparison :)}" 
            arity="{count(if(following-sibling::code) 
                          then following-sibling::code[@class='arg'] 
                          else ancestor::table[1]/tr/td/code[@class='arg'])}"/>
    </xsl:template>

    <!-- F&O 2.0 and 3.0 functions -->
    <xsl:template match="code[not(
            
            (: excluding the example functions and xs:dateTimeStamp (XSD 1.1 specific) :)
            matches(., 'fn:median
                |fn:numeric-function
                |fn:numeric-multiply
                |fn:function-name
                |prefix:TYPE
                |my:hatSize
                |eg:[a-zA-Z-]+
                |xs:dateTimeStamp', 'x'))]">
        
        <function 
            name="{.}" 
            arity="{count(if(following-sibling::code) 
                          then following-sibling::code[@class='arg'] 
                          else ancestor::table[@summary='Function/operator prototype']/tr/td/code[@class='arg'])}"/>
    </xsl:template>
</xsl:stylesheet>