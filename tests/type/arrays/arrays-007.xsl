<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
  exclude-result-prefixes="xs math" version="4.0">
  
  <xsl:param name="STREAMABLE" static="yes" select="false()"/>
  
  <xsl:mode _streamable="{$STREAMABLE}"/>
  
  <xsl:template match="/">
    <xsl:variable name="v" as="item()*">
      <xsl:apply-templates/>
    </xsl:variable>
    <out>
      <xsl:value-of select="serialize($v, map{'method':'json'})"/>
    </out>
  </xsl:template>
  
  <xsl:template match="cities">
    <xsl:array>
      <xsl:fork>
        <xsl:for-each-group select="city" group-by="@country">
          <xsl:sequence
            select=" 
            map {
            'country': current-grouping-key(),
            'sum-pop': sum(current-group()/@pop),
            'cities': array {current-group()/@name/string()}
            }" 
          />
        </xsl:for-each-group>
      </xsl:fork>
    </xsl:array>
  </xsl:template>
  
</xsl:stylesheet>