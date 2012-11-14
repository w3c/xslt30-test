<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:include - non-empty element -->
<?spec xslt#errors?><?error XTSE0260?>

<xsl:include href="../copy/copy01.xsl">text</xsl:include>
  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>