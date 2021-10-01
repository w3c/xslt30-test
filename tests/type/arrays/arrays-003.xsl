<?xml version="1.0" encoding="utf-8"?> 

<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0"
   xmlns:array="http://www.w3.org/2005/xpath-functions/array"
   exclude-result-prefixes="#all"
>
  
  <xsl:output method="json" build-tree="no"/>

<xsl:template match="/">
  <xsl:array>
    <xsl:for-each-group select=".//transaction" group-by="@date">
      <xsl:array select="current-group()/@value ! string()"/>
    </xsl:for-each-group>
  </xsl:array>
</xsl:template>


</xsl:stylesheet>
