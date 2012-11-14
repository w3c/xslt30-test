<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0690?>



  <xsl:template name="main">
    <out>
        <xsl:call-template name="x">
          
        </xsl:call-template>
    </out>
  </xsl:template>
  
  <xsl:template name="x">
    <xsl:param name="x" required="yes"/>
    <xsl:value-of select="2"/>
  </xsl:template>

  


</xsl:stylesheet>