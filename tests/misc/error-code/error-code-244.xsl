<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

<?error XTTE0520?>



  <xsl:template name="main">
    <out>
        <xsl:apply-templates select="concat('a', 'b')"/>
    </out>
  </xsl:template>
  
 
  


</xsl:stylesheet>