<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: <xsl:param> must come first -->
<?spec xslt#errors?><?error XTSE0010?>

  <xsl:template match="doc">
    <out/>
    <xsl:param name="p"/>
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>