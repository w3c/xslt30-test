<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://accum001/"
  exclude-result-prefixes="xs f" version="3.0">

  <!-- Simple test of an accumulator function -->

  <xsl:accumulator name="figNr" as="xs:integer" initial-value="0" streamable="no">
    <xsl:accumulator-rule match="chap" new-value="0"/>
    <xsl:accumulator-rule match="fig" new-value="$value + 1"/>
  </xsl:accumulator>

  <xsl:mode streamable="no" on-no-match="shallow-skip"/>
  <xsl:template match="fig">
    <xsl:apply-templates/>
    <p>Figure <xsl:value-of select="accumulator-before('figNr')"/>: <xsl:value-of select="@alt"/></p>
  </xsl:template>

  <xsl:template match="/">
    <figures>
      <xsl:apply-templates/>
    </figures>
  </xsl:template>
</xsl:stylesheet>
