<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1370?>


  <xsl:template name="main">
    <xsl:variable name="e" as="element()"><e/></xsl:variable>
    <out>
        <xsl:for-each select="$e">
          <xsl:sequence select="unparsed-entity-uri('pling')"/>
        </xsl:for-each>
    </out>
  </xsl:template>
  
  <xsl:function name="my:f">
    <xsl:sequence select="3"/>
  </xsl:function>
  



</xsl:stylesheet>