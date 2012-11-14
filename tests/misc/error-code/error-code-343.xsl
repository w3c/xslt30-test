<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1270?>

<xsl:key name="k" match="*" use="'pqr'"/>


  <xsl:template match="/">
    <out>
        <xsl:sequence select="my:f()"/>
    </out>
  </xsl:template>
  
  <xsl:function name="my:f">
    <xsl:sequence select="key('k', 'abc')"/>
  </xsl:function>
  



</xsl:stylesheet>