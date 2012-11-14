<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:template - not top level -->
<?spec xslt#errors?><?error XTSE0010?>

<xsl:template name="one">
<xsl:template match="p[@id=../@id]"/>
</xsl:template>
  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  


</xsl:stylesheet>