<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:apply-templates using undeclared prefix in mode name -->
<?spec xslt#errors?><?error XTSE0280?>

  <xsl:template match="doc">
    <out>
      <xsl:apply-templates select="item" mode="undeclared:mode">
         <xsl:sort select="."/>
      </xsl:apply-templates> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>