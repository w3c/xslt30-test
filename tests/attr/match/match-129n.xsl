<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!-- Purpose: Union pattern for matching atomic values - revised syntax -->


<xsl:template name="main">
 <out>
 	<xsl:apply-templates select="1, 2, 3.0e4, 'abc', xs:date('2010-10-10')"/>
 </out>
</xsl:template>

<xsl:template match=" ?{ . instance of xs:integer or . instance of xs:double } ">
  <n><xsl:value-of select="."/></n>
</xsl:template>

<xsl:template match=" ?{ . instance of xs:date }">
  <d><xsl:value-of select="."/></d>
</xsl:template>

<xsl:template match=" ?{ . instance of xs:anyAtomicType }" priority="0.1">
  <a><xsl:value-of select="."/></a>
</xsl:template>

</xsl:stylesheet>
