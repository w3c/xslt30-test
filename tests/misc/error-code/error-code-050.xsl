<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:call-template with surplus attribute -->
<?spec xslt#errors?><?error XTSE0090?>

  <xsl:template match="doc" name="this">
    <out>
      <xsl:call-template name="that" extra="spare">
         <xsl:with-param name="one" select="."/>
      </xsl:call-template> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  
  <xsl:template name="that">
    <xsl:param name="one"/>
  </xsl:template>


</xsl:stylesheet>