<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1170?>


  <xsl:template name="main">
    <out>
      <xsl:sequence select="unparsed-text('http://www.w3.org/Icons/w3c_home')"/>
      <!-- image URI -->
    </out>
  </xsl:template>
  



</xsl:stylesheet>