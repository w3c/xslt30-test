<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
xmlns:err="http://www.w3.org/2005/xqt-errors"
exclude-result-prefixes="err"
>

<!-- xsl:fallback with xsl:try in Saxon-SA and Saxon-B -->

<xsl:output indent="yes"/>


<xsl:template name="main">
<out>
  <xsl:try>
    <xsl:sequence select="2+2"/>
    <xsl:catch errors="*"/>
    <xsl:fallback>
      <xsl:sequence select="2+3"/>
    </xsl:fallback>
  </xsl:try>
</out>
</xsl:template>

</xsl:stylesheet>
