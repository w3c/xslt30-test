<?xml version="1.0" encoding="utf-8"?> 

<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0"
   xmlns:array="http://www.w3.org/2005/xpath-functions/array"
   exclude-result-prefixes="#all"
>

<xsl:template name="xsl:initial-template">
  <xsl:variable name="a" as="array(*)">
    <xsl:array composite="yes">
      <xsl:for-each select="1 to 10">
        <xsl:sequence select="parcel(. to .+1)"/>
      </xsl:for-each>
    </xsl:array>
  </xsl:variable>
  <out ok="{deep-equal($a, [(1,2), (2,3), (3,4), (4,5), (5,6), (6,7), (7,8), (8,9), (9,10), (10, 11)])}"/>
</xsl:template>


</xsl:stylesheet>
