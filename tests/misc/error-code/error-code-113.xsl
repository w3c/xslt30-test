<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:template - undeclared prefix -->
<?spec xslt#errors?><?error XTSE0280?>


<xsl:template name="nasty:name"/>

  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  


</xsl:stylesheet>