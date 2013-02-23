<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- validate element with type="xs:untypedAtomic" -->

  <xsl:template name="main">
    <xsl:variable name="v" as="node()*">
      <xsl:attribute name="a" select="'abcd'" type="xs:untypedAtomic"/>
      <z xsl:type="xs:untypedAtomic">abcd</z>
    </xsl:variable>
    <out 
      a="{$v[1] instanceof attribute(xs:untypedAtomic)}"
      b="{$v[2] instanceof element(xs:untypedAtomic)}"/>
  </xsl:template>

</xsl:stylesheet>
