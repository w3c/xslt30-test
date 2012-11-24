<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- Purpose: to be imported  -->

<xsl:param name="test" select="'test value set in final'"/>

<xsl:template match="b">
  <xsl:text>
  In final: </xsl:text><xsl:value-of select="$test"/>
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>