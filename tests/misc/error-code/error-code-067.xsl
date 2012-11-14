<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:element  -->
<?spec xslt#errors?><?error XTDE0830?>


  <xsl:template match="doc" name="this">
    <out>
      <xsl:element name="prefix:name"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  

</xsl:stylesheet>