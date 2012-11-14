<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:my="http://my.uri/">

<?error XTDE0420?>



  <xsl:template name="main">
    <out>
      <xsl:variable name="doc">
        <xsl:attribute name="ginger"/>
      </xsl:variable>
      <xsl:copy-of select="$doc"/>  
    </out>
  </xsl:template>
  


</xsl:stylesheet>