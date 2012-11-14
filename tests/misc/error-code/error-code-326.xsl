<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE1100?>


  <xsl:template name="main">
    <xsl:variable name="pop"><a/><b/><c/></xsl:variable>
    <out>
      <xsl:for-each-group select="$pop/*" group-adjacent="1,2,3">
         <xsl:value-of select="current-group()"/>
      </xsl:for-each-group>
    </out>
  </xsl:template>
  



</xsl:stylesheet>