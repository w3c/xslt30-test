<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  exclude-result-prefixes="xs" version="3.0">

  <!-- An accumulator must have at least one rule -->
  
  <xsl:accumulator name="a" as="xs:integer" initial-value="0">
  </xsl:accumulator>
  
  <xsl:template match="fig">
    <xsl:apply-templates/>
    <p>Figure <xsl:value-of select="accumulator-before('a')"/>: <xsl:value-of select="@alt"/></p>
  </xsl:template>

  <xsl:template match="/">
    <figures>
      <xsl:apply-templates/>
    </figures>
  </xsl:template>
</xsl:stylesheet>
