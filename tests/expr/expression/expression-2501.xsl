<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec xpath#combining_seq?>
  <!-- Purpose: NodeSet union using the attribute location path-->
  <!--  -->

 <xsl:template match="/">
   <out><xsl:text>
   </xsl:text>
    <xsl:for-each select="doc">
      <xsl:apply-templates select="attribute::attr1|attribute::attr2"/>
    </xsl:for-each>
   <xsl:text>
</xsl:text></out>
 </xsl:template>

 <xsl:template match="*">
   <xsl:value-of select="."/>
 </xsl:template>
</xsl:stylesheet>

