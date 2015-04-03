<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="math xs xsi"
    version="3.0">
    
    <xsl:output indent="no" method="text"/>
    
    <xsl:mode on-no-match="shallow-copy" />
    
    <xsl:template match="/">
         <xsl:apply-templates select="report/*"/>
    </xsl:template>
    
    <xsl:template match="feature">
       <xsl:value-of select="@name" />
       <xsl:text>: </xsl:text>
       <xsl:value-of select="@count" />
    </xsl:template>

 </xsl:stylesheet>