<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <?spec xpath#combining_seq?>
  <!-- Purpose: NodeSet union using the attribute location path-->
  <!-- Note, results depend on order of attributes which is implementation-dependent -->

  <xsl:template match="/">
    <out>
      <xsl:for-each select="doc">
        <xsl:apply-templates select="attribute::attr1 | attribute::attr2"/>
      </xsl:for-each>
    </out>
  </xsl:template>

  <xsl:template match="*">
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
