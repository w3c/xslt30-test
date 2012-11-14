<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: key name is not a valid QName -->
<?spec xslt#errors?><?error XTDE1260?>

  <xsl:template match="doc">
    <out>
      <xsl:value-of select="key('123456', '12')"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>