<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:element - bad prefix in QName -->
<?spec xslt#errors?><?error XTDE0820?>


  <xsl:template match="doc" name="this">
    <out>text
      <xsl:element name="1prefix:name" namespace="http://a.com/uri">
        <xsl:attribute name="nasty">value</xsl:attribute>
      </xsl:element>  
      <xsl:message>Error not detected (or recovered)!</xsl:message>
    </out>
  </xsl:template>
  

</xsl:stylesheet>