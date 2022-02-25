<?xml version="1.0" encoding="utf-8"?> 

<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0"
   xmlns:array="http://www.w3.org/2005/xpath-functions/array"
   exclude-result-prefixes="#all"
>

<xsl:template name="xsl:initial-template">
  <xsl:variable name="a" as="array(*)">
    <xsl:array>
      <xsl:sequence select="1 to 10"/>
    </xsl:array>
  </xsl:variable>
  <out count="{array:size($a)}" values="{$a?*}" last="{$a?10}"/>
</xsl:template>


</xsl:stylesheet>
