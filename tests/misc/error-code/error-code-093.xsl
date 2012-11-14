<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:include - not top-level -->
<?spec xslt#errors?><?error XTSE0170?>

<xsl:variable name="test">
<xsl:include href="error120.xsl"/>
</xsl:variable>
  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>