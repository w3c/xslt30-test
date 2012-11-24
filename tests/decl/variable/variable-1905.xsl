<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

 <?spec xslt#global-variables?>
  <!-- Purpose: Import precedence applies to top-level params
     (start at bottom; all use variable set in middle) -->
  

<xsl:import href="variable-1905a.xsl"/>
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

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