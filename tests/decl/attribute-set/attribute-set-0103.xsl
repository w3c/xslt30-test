<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

  <!-- PURPOSE: XSLT 3.0 on-empty attribute. -->
  <?spec xslt#attribute-sets?>
  
  <xsl:param name="color" select="()"/>
  <xsl:param name="texture" select="()"/>

  <xsl:attribute-set name="set1">
    <xsl:attribute name="color" on-empty="()" select="$color"/>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="set2">
    <xsl:attribute name="texture" on-empty="()" select="$texture"/>
  </xsl:attribute-set>

  <xsl:template match="/">
    <out>
      <test67 xsl:use-attribute-sets="set1 set2"></test67>
    </out>
  </xsl:template>

</xsl:stylesheet>
