<?xml version="1.0"?>

<!-- PURPOSE: test union operation applied to namespace nodes -->
  <?spec xpath#combining_seq?>

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="2.0">
<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:for-each select="//node()|//namespace::*">
    <xsl:sort select="name()"/>
    <xsl:sort select="."/>
    <xsl:call-template name="show"/>
  </xsl:for-each>
  <xsl:value-of select="count(//node()|//namespace::*)"/> combined nodes

  <xsl:for-each select="//namespace::*">
    <xsl:sort select="name()"/>
    <xsl:sort select="."/>
    <xsl:call-template name="show"/>
  </xsl:for-each>
  <xsl:value-of select="count(//namespace::*)"/> namespace nodes

  <xsl:for-each select="//node()">
    <xsl:call-template name="show"/>
  </xsl:for-each>
  <xsl:value-of select="count(//node())"/> node()s
</xsl:template>

<xsl:template name="show">
<xsl:text/> [<xsl:value-of select="name()"/>], <xsl:text/>
</xsl:template>

</xsl:transform>
