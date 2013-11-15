<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="a">
  <xsl:variable name="v" select="snapshot(/)"/>
  <xsl:choose>
    <xsl:when test="deep-equal(/, $v)"><ok/></xsl:when>
    <xsl:otherwise><xsl:sequence select="$v"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="b">
  <xsl:variable name="v" select="snapshot(/*)"/>
  <xsl:choose>
    <xsl:when test="deep-equal(/*, $v)"><ok doc="{exists($v/..)}"/></xsl:when>
    <xsl:otherwise><xsl:sequence select="$v"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="c">
  <xsl:sequence select="snapshot(//*:identifier)/self::*:identifier/ancestor::node()[last()]"/>
</xsl:template>



</xsl:stylesheet>