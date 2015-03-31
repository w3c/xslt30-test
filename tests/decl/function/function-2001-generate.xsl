<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- 
         creates: function-1902.xml
         generates a list of functions from the F&O 1.0 spec, for XSLT 2.0
         Modified (2015-03-30, ABr) fixed path, fixed prefix-adding (prefix is now in the spec as result of resolution of other bug)
    -->
    
    <xsl:mode on-no-match="shallow-skip" />
    <xsl:output indent="true" />
    
    <xsl:variable name="location">../../../../specs/xslt-lcwd30.xml</xsl:variable>
    
    <xsl:template name="xsl:initial-template">
        <xsl:result-document href="function-2001.xml">
            <function-list>
                <xsl:apply-templates select="doc($location)/html[1]/body[1]//code[@class='function']"></xsl:apply-templates>
            </function-list>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="code[not(
            
            (: excluding the example functions :)
            matches(., 'eg:[a-zA-Z-]+', 'x'))]">
        
        <!-- result of bug#27069: for functions that are in a different namespace, we get their name from the h5 elem -->
        <function 
            name="{(ancestor::dl/preceding-sibling::h5/a[text()]/text(), .)[1]}" 
            arity="{count(if(following-sibling::code) 
                          then following-sibling::code[@class='arg'] 
                          else ancestor::table[@summary/starts-with(., 'Function signature')]/tr/td/code[@class='arg'])}"/>
    </xsl:template>
    
</xsl:stylesheet>