<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

  <xsl:strip-space elements="chapter"/>

  <!-- demonstrate access to attributes of the context node -->
  
  <xsl:mode name="s" streamable="yes"/>
  
  <xsl:template name="main">
      <xsl:stream href="ot2.xml">
        <xsl:apply-templates select="." mode="s"/>
      </xsl:stream>  
  </xsl:template>
  
  <xsl:template match="*" mode="s">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="chapter" mode="s">
    <Kapital>
      <nr><xsl:value-of select="@nr"/></nr>
      <xsl:apply-templates mode="s"/>
    </Kapital>
  </xsl:template>  
  
  <xsl:template match="/" mode="s">
    <xsl:copy>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="v" mode="s"/>
  
</xsl:stylesheet>