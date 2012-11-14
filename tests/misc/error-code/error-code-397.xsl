<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE1545?>


  <xsl:template name="main">
    
    <out> 
      <xsl:attribute name="n" type="xs:QName">my:name</xsl:attribute>      
    </out>
  </xsl:template>
  




</xsl:stylesheet>