<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:my="http://my.uri/">

<?error XTSE0370?>



  <xsl:template name="main">
    <out>
      <e att="{2+2} and }3"/>
    </out>
  </xsl:template>
  


</xsl:stylesheet>