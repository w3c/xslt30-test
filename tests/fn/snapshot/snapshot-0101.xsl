<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="3.0">

  <xsl:template name="a">
    <xsl:variable name="v" select="snapshot(/)"/>
    <xsl:choose>
      <xsl:when test="deep-equal(/, $v)">
        <ok/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$v"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="b">
    <xsl:variable name="v" select="snapshot(/*)"/>
    <xsl:choose>
      <xsl:when test="deep-equal(/*, $v)">
        <ok doc="{exists($v/..)}"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$v"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="c">
    <xsl:sequence select="snapshot(//*:identifier)/self::*:identifier/ancestor::node()[last()]"/>
  </xsl:template>

  <xsl:template name="d">
    <xsl:variable name="result" select="snapshot((//*:identifier, 1, 'Fred', name#1))"/>
    <out>
      <xsl:value-of select="$result[1] instance of element(*) and 
          $result[2] instance of xs:integer and 
          $result[3] instance of xs:string and
          $result[4] instance of function(*)"/>
    </out>
  </xsl:template>



</xsl:stylesheet>
