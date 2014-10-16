<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- 
         creates: function-1901.xml
         generates a list of functions from the F&O 3.0 spec, for XSLT 3.0
    -->

    <xsl:mode on-no-match="shallow-skip" />
    <xsl:output indent="true" />
    
    <xsl:variable name="location">../../../../specs/functions-and-operators-rec30.xml</xsl:variable>
    
    <xsl:template name="xsl:initial-template">
        <xsl:result-document href="function-1901.xml">
            <function-list>
                <xsl:apply-templates select="doc($location)/html[1]/body[1]//code[@class='function']"></xsl:apply-templates>
            </function-list>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="code[not(
            
            (: excluding the example functions and xs:dateTimeStamp (XSD 1.1 specific) :)
            matches(., 'fn:median
                |fn:numeric-function
                |fn:numeric-multiply
                |fn:function-name
                |eg:[a-zA-Z-]+
                |xs:dateTimeStamp', 'x'))]">
        
        <function 
            name="{.}" 
            arity="{count(if(following-sibling::code) 
                          then following-sibling::code[@class='arg'] 
                          else ancestor::table[@summary='Function/operator prototype']/tr/td/code[@class='arg'])}"/>
    </xsl:template>
    
</xsl:stylesheet>