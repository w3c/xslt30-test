<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- validate element with type="xs:untyped" -->

  <xsl:template name="main">
    <xsl:variable name="v" as="element()">
      <z xsl:type="untyped" foo="1" bar="2">
        <y/>
      </z>
    </xsl:variable>
    <out 
      a="{$v instanceof element(xs:untyped)}"
      b="{$v/@foo instanceof attribute(xs:untypedAtomic)}"
      c="{$v/@bar instanceof attribute(xs:untypedAtomic)}"
      d="{$v/y instanceof element(xs:untyped)}"/>
  </xsl:template>

</xsl:stylesheet>
