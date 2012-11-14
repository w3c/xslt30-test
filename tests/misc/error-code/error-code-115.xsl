<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:template - duplicate name -->
<?spec xslt#errors?><?error XTSE0660?>


<xsl:template name="x:one" xmlns:x="http://one.uri/"/>

  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  
<xsl:template name="y:one" xmlns:y="http://one.uri/"/>

</xsl:stylesheet>