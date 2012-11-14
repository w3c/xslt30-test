<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0890?>

<xsl:param name="p" select="'ns'"/>

  <xsl:template name="main">
    <my:out>
        <xsl:processing-instruction name="42" select="3"/>
    </my:out>
  </xsl:template>
  



</xsl:stylesheet>