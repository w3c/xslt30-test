<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://accum001/"
  exclude-result-prefixes="xs f" version="3.0">

  <!-- Get post-descent value of accumulator -->

  <xsl:accumulator name="f:figNr" post-descent="f:figNrAfter" as="xs:decimal" initial-value="0"
    streamable="no">
    <xsl:accumulator-rule match="chap" new-value="0"/>
    <xsl:accumulator-rule match="fig" new-value="$value + 1"/>
    <xsl:accumulator-rule match="diag" new-value="$value + 0.5"/>
  </xsl:accumulator>

  <xsl:mode streamable="no" on-no-match="shallow-skip"/>
  <xsl:template match="fig">
    <pix>
      <p>Figure <xsl:value-of select="f:figNr()"/> start</p>
      <xsl:apply-templates/>
      <p>Figure <xsl:value-of select="f:figNrAfter()"/> end</p>
    </pix>
  </xsl:template>


  <xsl:template match="/">
    <figures>
      <xsl:apply-templates/>
    </figures>
  </xsl:template>
</xsl:stylesheet>
