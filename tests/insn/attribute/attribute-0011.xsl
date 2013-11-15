<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

  <!-- PURPOSE: XSLT 3.0 on-empty attribute creating an attribute that fails validation. -->
  
  <xsl:param name="aname" select="'a'"/>
  <xsl:param name="color" select="()"/>
  <xsl:param name="texture" select="()"/>
  <xsl:param name="z" as="node()?">
    <xsl:attribute name="y">http://www.w3.org/2001/Magic</xsl:attribute>
  </xsl:param>

  <xsl:template match="/" name="main">
    <out>
      <test68>
        <xsl:attribute name="{$aname}" select="$color" on-empty="()"/>
        <xsl:attribute name="b" select="if (exists($color)) then 'green' else 'blue'" on-empty="()"/>
        <xsl:attribute name="c" select="if (exists($color)) then '3' else ''" type="xs:integer" on-empty="$z"/>
      </test68>
    </out>
  </xsl:template>

</xsl:stylesheet>
