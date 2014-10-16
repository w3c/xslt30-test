<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- 
         creates: function-1902.xml (list of functions of F&O 3.0 that are NOT in F&O 1.0
         generates a list of functions of F&O 3.0 that are NOT in F&O 1.0 spec, for XSLT 2.0
         TODO: this generator was updated and needs to be verified
    -->
    
    <xsl:mode on-no-match="shallow-skip" />
    <xsl:output indent="true" />
    
    <xsl:variable name="location20">../../../../specs/functions-and-operators-rec20.xml</xsl:variable>
    <xsl:variable name="location30">../../../../specs/functions-and-operators-rec30.xml</xsl:variable>
    
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
        <xsl:result-document href="function-1902.xml">
            <function-list>
                <xsl:copy-of select="$fo30/*:function-list/*:function[not(@name || @arity = $fo20/*:function-list/*:function/(@name || @arity))]" />
            </function-list>
        </xsl:result-document>
    </xsl:template>
    
    
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