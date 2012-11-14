<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0640?>

  <xsl:param name="ping" select="$pong+2"/>   

  <xsl:template name="main">
    <out>
        <xsl:value-of select="$pong"/>
    </out>
  </xsl:template>
  
  <xsl:variable name="pong" select="$ping - 2"/>   

  


</xsl:stylesheet>