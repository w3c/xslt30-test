<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:include - invalid URL -->
<?spec xslt#errors?><?error XTSE0165?>

<xsl:include href="magic://file.xsl"/>
  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>