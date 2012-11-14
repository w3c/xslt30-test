<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

<?error XTSE0580?>



  <xsl:template name="main">
    <out>
        <xsl:apply-templates/>
    </out>
  </xsl:template>
  
  <xsl:template match="doc">
    <xsl:param name="p" select="1"/>
    <xsl:param name="p" select="2"/> 
    <xsl:value-of select="$p"/>
  </xsl:template>   
  


</xsl:stylesheet>