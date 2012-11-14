<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:variable - duplicate name -->
<?spec xslt#errors?><?error XTSE0630?>

  <xsl:variable name="x" select="1"/>
  <xsl:variable name="x" select="2"/>
 
  <xsl:template match="doc">

    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>