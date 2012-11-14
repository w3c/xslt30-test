<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<?spec xslt#patterns?>
    <!-- Purpose: Basic priority test for matching atomic values. -->

<xsl:template name="main">
 <out>
 	<xsl:apply-templates select="1.5, 1 to 4, 3.5, 4.6"/>
 </out>
</xsl:template>

<xsl:template match="~xs:integer">
  <i><xsl:value-of select="."/></i>
</xsl:template>

<xsl:template match="~xs:decimal">
  <d><xsl:value-of select="."/></d>
</xsl:template>

</xsl:stylesheet>
