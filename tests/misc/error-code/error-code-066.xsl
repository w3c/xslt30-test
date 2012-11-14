<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:element bad element name (this was a recoverable error) -->
<?spec xslt#errors?><?error XTDE0820?>


  <xsl:template match="doc" name="this">
    <out>
      <xsl:element name="a bad name"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  

</xsl:stylesheet>