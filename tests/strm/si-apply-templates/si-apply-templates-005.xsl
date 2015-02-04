<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  <xsl:mode name="s" streamable="yes"/>

  <xsl:template match="/*" mode="s">
    <xsl:param name="a" tunnel="yes"/>

    <xsl:if test="$a">
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="main">
    <xsl:apply-templates select="doc('si-apply-templates-003.xml')" mode="s">
      <xsl:with-param name="a" select="'a'" tunnel="yes"/>
    </xsl:apply-templates>
  </xsl:template>
</xsl:stylesheet>

