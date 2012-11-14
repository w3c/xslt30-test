<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<!-- Error: xsl:stylesheet no version att -->
<?spec xslt#errors?><?error XTSE0010?>

  <xsl:template match="doc">
    <out>
      <xsl:value-of select="22"/> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>