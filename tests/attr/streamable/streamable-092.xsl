<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, xsl:value-of concatenating text nodes 
       from within and outwith the streamed document -->
  
   
  <xsl:mode name="s" streamable="yes"/>
  <xsl:strip-space elements="*"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
    
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('loans.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:param name="t" as="text()">
    <xsl:text>##</xsl:text>
  </xsl:param>
  
  <xsl:template match="Property" mode="s">
      <State>
        <xsl:value-of>
          <xsl:value-of select="$t"/>
          <xsl:value-of select="Address/State"/>
          <xsl:value-of select="$t"/>
        </xsl:value-of>
      </State>
  </xsl:template>
  
  <xsl:template match="text()" mode="#all"/>
       
</xsl:transform>

