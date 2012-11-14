<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:apply-templates (select att must be a node()*)-->
<?spec xslt#errors?><?error XTSE0520?>

  <xsl:template match="doc">
    <out>
      <xsl:apply-templates select="3">
         <xsl:sort select="."/>
      </xsl:apply-templates> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>