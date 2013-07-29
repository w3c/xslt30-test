<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:f="http://localhost/" exclude-result-prefixes="f">

  <!-- PURPOSE: XSLT 3.0 on-empty attribute. -->
  
  <!-- This test is rather artificial; it is written to force Saxon down a path that is only used when creating
  parentless attribute nodes -->
  
  <?spec xslt#attribute-sets?>
  
  <xsl:param name="aname" select="'a'"/>
  <xsl:param name="color" select="()"/>
  <xsl:param name="texture" select="()"/>

 

  <xsl:template match="/" name="main">
    <xsl:variable name="a" as="attribute(*)?" select="f:makeAtt($aname, $color)"/>

      <atrs69>
        <xsl:if test="exists($a)">
          <xsl:value-of select="'[', string($a), ']'"/>
        </xsl:if>
      </atrs69>
    
  </xsl:template>
  
  <xsl:function name="f:makeAtt" as="attribute(*)?">
    <xsl:param name="aname"/>
    <xsl:param name="avalue"/>
    <!-- make the function appear recursive to prevent inlining -->
    <xsl:if test="string-length($aname) > 10000">
      <xsl:sequence select="f:makeAtt(substring($aname, 10), $avalue)"/>
    </xsl:if>
    <xsl:attribute name="{$aname}" select="$color" on-empty="()"/>
  </xsl:function>

</xsl:stylesheet>
