<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTSE0020?>

  <xsl:template match="doc">
    <out>
      <xsl:copy-of select="." copy-namespaces="maybe"/>
    </out>
  </xsl:template>

</xsl:stylesheet>