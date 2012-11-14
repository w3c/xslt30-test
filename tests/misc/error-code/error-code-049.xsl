<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:call-template  -->
<?spec xslt#errors?><?error XTSE0650?>

  <xsl:template match="doc">
    <out>
      <xsl:call-template name="not-present">
         <xsl:with-param name="one" select="."/>
      </xsl:call-template> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>


</xsl:stylesheet>