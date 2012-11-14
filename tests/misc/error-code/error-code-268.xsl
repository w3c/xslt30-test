<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0700?>



  <xsl:template match="/">
    <out>
        <xsl:apply-templates/>
    </out>
  </xsl:template>
  
  <xsl:template match="doc">
    <xsl:param name="x" required="yes"/>
    <xsl:value-of select="2"/>
  </xsl:template>

  


</xsl:stylesheet>