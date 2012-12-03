<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

  <xsl:strip-space elements="chapter"/>

  <!-- create an attribute from the contents of a node -->
  
  <xsl:mode name="s" streamable="yes"/>
  
  <xsl:template name="main">
    <xsl:apply-templates select="doc('ot2.xml')" mode="s"/>
  </xsl:template>
  
  <xsl:template match="*" mode="s">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
   
  <xsl:template match="v" mode="s">
    <v text="{.}"/>
  </xsl:template>
  
</xsl:stylesheet>