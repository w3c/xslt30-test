<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.1"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

  <xsl:strip-space elements="chapter"/>

  <!-- copy the verses, lose the rest of the markup. -->
  
  <xsl:mode name="s" streamable="yes"/>
  
  <xsl:template name="main">
    <out>
      <xsl:apply-templates select="doc('ot.xml')" mode="s"/>
    </out>
  </xsl:template>
   
  <xsl:template match="v" mode="s">
    <xsl:copy>
      <xsl:value-of select="."/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="text()" mode="s"/>
  
</xsl:stylesheet>