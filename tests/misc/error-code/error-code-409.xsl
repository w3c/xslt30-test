<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTDE0040?>

<xsl:param name="x" select="'bananas'"/>

  <xsl:template name="not-main">
    <out>
      <xsl:apply-templates/>
    </out>
  </xsl:template>

</xsl:stylesheet>