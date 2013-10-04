<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://accum005/"
  exclude-result-prefixes="xs f" version="3.0">

  <!-- Use accumulators to match text nodes -->

  <xsl:accumulator name="f:last-p" 
  					as="xs:string" 
  					initial-value="''"
  					streamable="no">
    <xsl:accumulator-rule match="section/p/text()" new-value="string(.)"/>
  </xsl:accumulator>


  <xsl:mode streamable="no" on-no-match="shallow-copy"/>

  <xsl:template match="section">
    <xsl:apply-templates/>
    <last><xsl:value-of select="accumulator-after('f:last-p')"/></last>
  </xsl:template>

  <xsl:strip-space elements="*"/>

</xsl:stylesheet>
