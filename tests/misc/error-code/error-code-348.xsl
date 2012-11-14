<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE1295?>

<xsl:decimal-format name="d" zero-digit="2"/>






  <xsl:template name="main">
    <xsl:variable name="e" as="element()"><e/></xsl:variable>
    <xsl:variable name="d"><e/></xsl:variable>    
    <out>
        <xsl:sequence select="format-number(12, '##0', 'd')"/>
    </out>
  </xsl:template>
  



</xsl:stylesheet>