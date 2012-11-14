<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTRE1160?>


  <xsl:template name="main">
    <out>
      <xsl:sequence select="document('http://www.w3.org/2005/11/schema-for-xslt20.xsd#123456789')"/>
    </out>
  </xsl:template>
  



</xsl:stylesheet>