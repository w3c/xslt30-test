<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:call-template - omitted template name -->
<?spec xslt#errors?><?error XTSE0010?>

<xsl:template name="x"/>
  
  <xsl:template match="doc">
    <out>
      <xsl:call-template/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  


</xsl:stylesheet>