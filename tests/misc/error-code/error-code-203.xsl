<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTDE0050?>

<xsl:param name="x" required="yes"/>

  <xsl:template name="main">
    <out>
      <xsl:apply-templates select="$x"/>
    </out>
  </xsl:template>

</xsl:stylesheet>