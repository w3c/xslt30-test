<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mf="http://example.com/mf"
  exclude-result-prefixes="#all" version="3.0">
  
  <xsl:param name="STREAMABLE" static="yes" select="false()"/>
  
  <xsl:mode on-no-match="shallow-skip" use-accumulators="#all" _streamable="{$STREAMABLE}"/>
  
  <xsl:accumulator name="A" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields/data/id1" phase="end"
      select="accumulator-after('values') => subsequence(1, 3) => sum()"/>
  </xsl:accumulator>
  
  <xsl:accumulator name="B" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields/data/id1" phase="end"
      select="accumulator-after('values') => subsequence(4, 3) => sum()"/>
  </xsl:accumulator>
  
  <xsl:accumulator name="C" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields/data/id2" phase="end"
      select="accumulator-after('values') => subsequence(1, 3) => sum()"/>
  </xsl:accumulator>
  
  <xsl:accumulator name="D" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields/data/id2" phase="end"
      select="accumulator-after('values') => subsequence(4, 3) => sum()"/>
  </xsl:accumulator>
  
  <xsl:accumulator name="values" as="xs:integer*" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="data" select="()"/>
    <xsl:accumulator-rule match="data/id1/text() | data/id2/text()"
      select="
      analyze-string(., '.')//*:match ! (
      if (. = '.')
      then
      15
      else
      if (. = ' ')
      then
      20
      else
      xs:integer(.))"
    />
  </xsl:accumulator>
  
  <xsl:accumulator name="remainder" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields/data" select="()"/>
    <xsl:accumulator-rule match="fields/data" phase="end"
      select="
      abs((accumulator-after('B') + accumulator-after('D')) -
      (accumulator-after('A') + accumulator-after('C'))) mod 13"
    />
  </xsl:accumulator>
  
  <xsl:accumulator name="remainder-sum" as="xs:integer?" initial-value="()" _streamable="{$STREAMABLE}">
    <xsl:accumulator-rule match="fields" select="0"/>
    <xsl:accumulator-rule match="fields/data" phase="end" select="$value + accumulator-after('remainder')"/>
  </xsl:accumulator>
  
  
  <xsl:template match="fields">
    <xsl:apply-templates/>
    <z><xsl:sequence select="accumulator-after('remainder-sum')"/></z>
  </xsl:template>
  
  <xsl:template match="root">
    <out><xsl:apply-templates/></out>
  </xsl:template>
  
</xsl:stylesheet>