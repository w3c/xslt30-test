<?xml version="1.0" encoding="iso-8859-1"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: Calling xsl:apply-imports when the current template rule is null -->
<?spec xslt#errors?><?error XTDE0560?>

  <xsl:template match="/">
    <out>
      <xsl:for-each select=".">
        <xsl:apply-imports/>
      </xsl:for-each>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>