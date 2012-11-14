<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1390?>

  <xsl:param name="p" select="''"/>


  <xsl:template name="main">
    
    <out>        
          <xsl:sequence select="system-property(concat($p, ':prop'))"/>        
    </out>
  </xsl:template>
  



</xsl:stylesheet>