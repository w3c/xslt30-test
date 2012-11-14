<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE1430?>

  <xsl:param name="p" select="'123'"/>


  <xsl:template name="main">
    
    <out>        
          <e xsl:extension-element-prefixes="my your"/>     
    </out>
  </xsl:template>
  



</xsl:stylesheet>