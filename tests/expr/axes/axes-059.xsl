<?xml version="1.0"?> 

<?spec fo#func-root?>
  <!-- PURPOSE: Test root() function. -->
  <?same-as-1.0 no?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes"/>

  <xsl:template match="/">
  
  <xsl:variable name="t"><element-node/></xsl:variable>
  <xsl:variable name="u">text-node</xsl:variable>
  <out>
  [<xsl:value-of select="(/) is root()"/>]
  [<xsl:value-of select="(/) is root(//b)"/>]    
  [<xsl:value-of select="$t is root($t/element-node)"/>]
  [<xsl:value-of select="$u is root($u/text())"/>] 
  </out>
  </xsl:template>


</xsl:stylesheet>
