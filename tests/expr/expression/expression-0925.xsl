<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
>

<!-- test index-of() (XPath 2.0) -->
<?spec fo#func-index-of?>

<xsl:output indent="yes"/>
<xsl:template match="/">
  <xsl:variable name="seq" select="('1','2','3','4','5','5','4','3','2','1')"/>
  <xsl:variable name="nodes" select="//item/@val"/>
  <out>
    <r56><xsl:value-of select="index-of($seq, '5')" separator=", "/></r56>
    <r47><xsl:value-of select="index-of($seq, '4')" separator=", "/></r47>
    <r0><xsl:value-of select="index-of($seq, '0')" separator=", "/></r0> 
    <r2><xsl:value-of select="index-of($nodes, '2')" separator=", "/></r2>     
    <r5><xsl:value-of select="index-of($nodes, '5')" separator=", "/></r5>
  </out>
</xsl:template>
 
</xsl:stylesheet>
