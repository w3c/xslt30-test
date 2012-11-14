<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:call-template using an undeclared namespace  -->
<?spec xslt#errors?><?error XTSE0280?>

  <xsl:template match="doc" name="this">
    <out>
      <xsl:call-template name="a:template"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  
<xsl:template name="a:template" xmlns:a="http://a.uri/"/>  


</xsl:stylesheet>