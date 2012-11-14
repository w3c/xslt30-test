<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://wrong-namespace-uri/" version="2.0" 
 exclude-result-prefixes="one, two, three">

<!-- Error: xsl:stylesheet wrong namespace -->
<?spec xslt#errors?><?error XTSE0150?>

  <xsl:template match="doc">
    <out>
      <xsl:value-of select="22"/> 
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>