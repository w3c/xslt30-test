<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, for-each instruction selecting the ancestors of a streamed node -->
  
   
  <xsl:mode name="s" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
  
  <xsl:param name="sep" select="'|'" as="xs:string"/>
   
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('loans.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="Loan" mode="s">
    <loan>
      <xsl:for-each select="ancestor::*">
        <xsl:value-of select="concat(name(.), '/')"/>
      </xsl:for-each>
    </loan>
  </xsl:template>
  
  <xsl:template match="text()" mode="#all"/>
       
</xsl:transform>

