<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:my="http://my.net/" exclude-result-prefixes="my saxon xs">

  <!-- PURPOSE test initial-function invocation -->

  <xsl:function name="my:foo">
    <xsl:param name="a"/>
    <xsl:param name="b"/>
    <simple-data><xsl:value-of select="$b"/>Simple Data<xsl:value-of select="$a"/></simple-data>
  </xsl:function>
  <xsl:function name="my:bar" as="item()*">
    <xsl:param name="a"/>
    <xsl:param name="b"/>
    <xsl:sequence select="$a,$b"/>
  </xsl:function>

  

</xsl:stylesheet>
