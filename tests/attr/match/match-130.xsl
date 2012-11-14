<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<?spec xslt#patterns?>
    <!-- Purpose: Pattern for matching atomic values with a predicate. -->

<xsl:template name="main">
 <out>
 	<xsl:apply-templates select="-2 to +2"/>
 </out>
</xsl:template>

<xsl:template match="~xs:integer[.=0]">
  <zero><xsl:value-of select="."/></zero>
</xsl:template>

<xsl:template match="~xs:integer[. lt 0]">
  <negative><xsl:value-of select="."/></negative>
</xsl:template>

<xsl:template match="~xs:integer[. gt 0]">
  <positive><xsl:value-of select="."/></positive>
</xsl:template>

</xsl:stylesheet>
