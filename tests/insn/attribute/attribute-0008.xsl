<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

  <!-- PURPOSE: XSLT 3.0 on-empty attribute creating an attribute. -->
  <?spec xslt#attribute-sets?>
  
  <xsl:param name="aname" select="'a'"/>
  <xsl:param name="color" select="()"/>
  <xsl:param name="texture" select="()"/>
  <xsl:variable name="z" as="attribute()">
    <xsl:attribute name="z">azure</xsl:attribute>
  </xsl:variable>

  <xsl:template match="/" name="main">
      <test68>
        <xsl:attribute name="{$aname}" select="$color" on-empty="()"/>
        <xsl:attribute name="b" select="if (exists($color)) then 'green' else 'blue'" on-empty="()"/>
        <xsl:attribute name="c" select="if (exists($color)) then 'green' else ''" on-empty="$z"/>
      </test68>
  </xsl:template>

</xsl:stylesheet>
