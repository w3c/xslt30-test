<?xml version="1.0"?>
<!-- test xsl:evaluate calling an extension function -->
<!-- formerly test saxon037 -->

<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:saxon="http://saxon.sf.net/" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="saxon xs">

<xsl:param name="exp" select="if (function-available('saxon:system-id', 0)) then 'saxon:system-id()' else 'string(())'"/>

<xsl:variable name="id" as="xs:string">
  <xsl:evaluate xpath="$exp" context-item="."/>
</xsl:variable>

<xsl:template match="/">
<out>
   <xsl:choose>
   <xsl:when use-when="function-available('saxon:system-id', 0)" test="$id = saxon:system-id()">OK</xsl:when>
   <xsl:when use-when="not(function-available('saxon:system-id', 0))" test="true()">OK</xsl:when>
   <xsl:otherwise>TEST FAILED: <xsl:value-of select="saxon:system-id()"/></xsl:otherwise>
   </xsl:choose>
</out>
</xsl:template>

</xsl:stylesheet>

