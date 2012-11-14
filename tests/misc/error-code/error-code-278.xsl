<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE0790?>



  <xsl:template name="main">
    <out>
        <xsl:sequence select="my:f(2)"/>
    </out>
  </xsl:template>
  
<xsl:function name="my:f">
  <xsl:param name="x" as="xs:date"/>
  <xsl:sequence select="$x"/>
</xsl:function>



</xsl:stylesheet>