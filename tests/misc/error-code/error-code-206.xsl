<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTSE0080?>


  <xsl:template name="xsl:main">
    <xsl:param name="y" required="yes"/>
    <out>
      <xsl:apply-templates select="$y"/>
    </out>
  </xsl:template>

</xsl:stylesheet>