<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >

<!-- Error: xsl:decimal-format: name attribute is not an AVT -->
<?spec xslt#errors?><?error XTSE0020?>

<xsl:decimal-format name="{concat('f', 'f')}" grouping-separator="|"/>
<xsl:decimal-format name="ff" grouping-separator="/"/>

  <xsl:template match="doc" name="this">
    <out>
      <xsl:value-of select="format-number(1234.56, '####0.00', 'ff')"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  

</xsl:stylesheet>