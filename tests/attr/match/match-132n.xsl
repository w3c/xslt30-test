<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <!-- Purpose: numeric value of predicate. New syntax -->

<xsl:template name="main">
 <out>
 	<xsl:apply-templates select="17"/>
 </out>
</xsl:template>

<xsl:template match=".[ . instance of xs:integer ]">
  <first><xsl:next-match/></first>
</xsl:template>

<xsl:template match=".[ .[2] instance of xs:integer ]">
  <second><xsl:next-match/></second>
</xsl:template>

</xsl:stylesheet>
