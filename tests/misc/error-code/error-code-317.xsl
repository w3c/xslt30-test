<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1035?>


  <xsl:template name="main">
    <out>
      <xsl:for-each select="1 to 5">
        <xsl:sort select="." collation="http://a.collation.that.noone.is.likely.to.recognize/"/>
        <xsl:value-of select="."/>
      </xsl:for-each>
    </out>
  </xsl:template>
  



</xsl:stylesheet>