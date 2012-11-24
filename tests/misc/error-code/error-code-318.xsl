<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE1040?>


  <xsl:template name="main">
    <out>
      <xsl:perform-sort select="1 to 5">
        <xsl:sort select="."/>
        <xsl:value-of select="."/>
      </xsl:perform-sort>
    </out>
  </xsl:template>
  



</xsl:stylesheet>