<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:attribute-set - extra attributes -->
<?spec xslt#errors?><?error XTSE0010?>

  <xsl:attribute-set name="aset1" extra="extra">
    <xsl:attribute name="one">1</xsl:attribute>
    <xsl:attribute name="two">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="doc">
    <out>
      <xsl:copy/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>