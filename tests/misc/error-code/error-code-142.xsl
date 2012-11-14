<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:param - wrong position  -->
<?spec xslt#errors?><?error XTSE0010?>

  <xsl:template match="doc">
    <out>
      <xsl:variable name="x">text</xsl:variable>
      <xsl:message>Error not detected!</xsl:message>
    </out>
    <xsl:param name="x" select="3"/>
  </xsl:template>

</xsl:stylesheet>