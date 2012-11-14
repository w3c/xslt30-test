<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0835?>



  <xsl:template name="main">
    <my:out>
        <xsl:element name="your:element" namespace="##not-a-uri"/>
    </my:out>
  </xsl:template>
  



</xsl:stylesheet>