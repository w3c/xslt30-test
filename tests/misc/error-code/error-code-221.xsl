<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTSE0200?>


  <xsl:template name="main">
    <out>
      <xsl:apply-templates/>
    </out>
  </xsl:template>

  <xsl:import href="emptymodule.xsl"/>


</xsl:stylesheet>