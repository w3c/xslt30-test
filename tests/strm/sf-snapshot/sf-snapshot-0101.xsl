<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="a">
<xsl:stream href="sf-snapshot-01.xml">
  <xsl:variable name="v" select="snapshot(/)"/>
  <xsl:choose>
    <xsl:when test="deep-equal(doc('sf-snapshot-01.xml'), $v)"><ok/></xsl:when>
    <xsl:otherwise><xsl:sequence select="$v"/></xsl:otherwise>
  </xsl:choose>
</xsl:stream>    
</xsl:template>

<xsl:template name="b">
<xsl:stream href="sf-snapshot-01.xml">
  <xsl:variable name="v" select="snapshot(/*)"/>
  <xsl:choose>
    <xsl:when test="deep-equal(doc('sf-snapshot-01.xml')/*, $v)"><ok doc="{exists($v/..)}"/></xsl:when>
    <xsl:otherwise><xsl:sequence select="$v"/></xsl:otherwise>
  </xsl:choose>
</xsl:stream>    
</xsl:template>

<xsl:template name="c">
<xsl:stream href="sf-snapshot-01.xml">
  <xsl:sequence select="snapshot(//*:identifier)/self::*:identifier/ancestor::node()[last()]"/>
</xsl:stream>  
</xsl:template>



</xsl:stylesheet>