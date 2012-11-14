<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0910?>

<xsl:param name="p" select="'ns'"/>

  <xsl:template name="main">
    <my:out>
        <xsl:namespace name="ns" select="'http://www.your.uri/'">http://my.com/</xsl:namespace>
    </my:out>
  </xsl:template>
  



</xsl:stylesheet>