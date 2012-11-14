<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- Purpose: Import precedence applies to top-level params
     (first template from middle, then up/down/up) -->

<xsl:import href="variable-1903a.xsl"/>
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:param name="test" select="'main stylesheet, should have highest precedence'"/>

<xsl:template match="a">
  <xsl:text>
  In main: </xsl:text><xsl:value-of select="$test"/>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="c">
  <xsl:text>
  In main again: </xsl:text><xsl:value-of select="$test"/>
</xsl:template>

</xsl:stylesheet>
