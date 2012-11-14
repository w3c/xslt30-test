<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:variable - select attribute plus content  -->
<?spec xslt#errors?><?error XTSE0620?>

  <xsl:template match="doc">
    <out>
      <xsl:variable name="x" select="1">text</xsl:variable>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>