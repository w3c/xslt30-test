<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:variable - self-reference -->
<?spec xslt#errors?><?error XTDE0640?>

<xsl:variable name="x" select="$x+1"/>

  <xsl:template match="/">
    <out val="{$x}">
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>