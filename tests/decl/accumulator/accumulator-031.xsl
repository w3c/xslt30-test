<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  exclude-result-prefixes="xs" version="3.0">

  <!-- Accumulator has circular dependency on global variable -->
  
  <xsl:mode streamable="yes"/>
  
  <xsl:accumulator name="a" as="xs:integer" initial-value="0" streamable="yes">
    <xsl:accumulator-rule match="*" select="$value + $count"/>
  </xsl:accumulator>

  <xsl:variable name="count">
    <xsl:stream href="accumulator-001.xml">
      <xsl:for-each select="*"/>
      <xsl:value-of select="accumulator-after('a')"/>
    </xsl:stream>
  </xsl:variable>
  
  <xsl:template name="main">
    <o><xsl:value-of select="$count"/></o>
  </xsl:template>
</xsl:stylesheet>
