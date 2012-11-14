<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://local/"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!-- Pass a sequence of functions that cannot be coerced to the required type -->
 
 
    <xsl:function name="local:apply" as="xs:string">
        <xsl:param name="fns" as="(function(xs:string) as xs:string)*"/>
        <xsl:param name="s" as="xs:string"/>       
    </xsl:function>
    
    <xsl:variable name="ops" as="item()*" 
        select="(upper-case#1, lower-case#1, function($x as xs:double){string($x)})"/>
    
 
    <xsl:template name="main">
        <out>
            <xsl:value-of select="local:apply($ops, 'Michael Kay')" separator="~"/>
        </out>
    </xsl:template>
    
 
     
 
</xsl:stylesheet>