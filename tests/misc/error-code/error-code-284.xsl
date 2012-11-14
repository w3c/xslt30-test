<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0820?>



  <xsl:template name="main">
    <my:out>
        <xsl:element name="{concat('my:element', '#')}"/>
    </my:out>
  </xsl:template>
  



</xsl:stylesheet>