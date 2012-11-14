<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<?spec xslt#patterns?>
    <!-- Purpose: numeric value of predicate. Rules unclear, see spec bug 12455 -->

<xsl:template name="main">
 <out>
 	<xsl:apply-templates select="17"/>
 </out>
</xsl:template>

<xsl:template match="~xs:integer">
  <first><xsl:next-match/></first>
</xsl:template>

<xsl:template match="~xs:integer[2]">
  <second><xsl:next-match/></second>
</xsl:template>

</xsl:stylesheet>
