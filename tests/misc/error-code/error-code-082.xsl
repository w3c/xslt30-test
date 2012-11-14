<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: reference to unknown xsl:attribute-set -->
<?spec xslt#errors?><?error XTSE0710?>

  <xsl:attribute-set name="aset1" use-attribute-sets="aset2">
    <xsl:attribute name="one">1</xsl:attribute>
    <xsl:attribute name="two">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="aset2">
    <xsl:attribute name="three">3</xsl:attribute>
    <xsl:attribute name="four">4</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="doc">
    <out>
      <xsl:copy use-attribute-sets="aset1 aset2 aset3"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>