<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:call-template - unknown template name -->
<?spec xslt#errors?><?error XTSE0650?>

<xsl:template name="x"/>
  
  <xsl:template match="doc">
    <out>
      <xsl:call-template name="y"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  


</xsl:stylesheet>