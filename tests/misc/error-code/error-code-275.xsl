<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0760?>



  <xsl:template match="/">
    <out>
        <xsl:apply-templates/>
    </out>
  </xsl:template>
  
<xsl:function name="my:f">
  <xsl:param name="x">3</xsl:param>
  <xsl:sequence select="2"/>
</xsl:function>



</xsl:stylesheet>