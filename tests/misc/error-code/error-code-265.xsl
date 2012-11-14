<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0670?>



  <xsl:template name="main">
    <out>
        <xsl:apply-templates>
          <xsl:with-param name="my:p" select="2"/>
          <xsl:with-param name="q" select="2"/>
          <xsl:with-param name="r" select="2"/>
          <xsl:with-param name="your:p" select="2" xmlns:your="http://my.com/"/>
        </xsl:apply-templates>  
    </out>
  </xsl:template>
  

  


</xsl:stylesheet>