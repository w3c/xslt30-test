<?xml version="1.0"?>
<xsl:stylesheet version="3.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">

<?spec xslt#validation-xsl-type?>

<!-- Validation takes place if there is an on-empty attribute (XSLT 3.0) -->

<xsl:param name="p" select="''"/>

<xsl:variable name="v"><foo bar="12.4"/></xsl:variable>

<xsl:template name="main">
  <out>
    <xsl:attribute name="wrong" type="xs:integer" select="$p" on-empty="$v//@bar"/>
  </out>
</xsl:template>

<xsl:template name="a">
  <out>
    <xsl:attribute name="wrong" type="xs:integer" select="$p" on-empty="$v"/>
  </out>
</xsl:template>


</xsl:stylesheet>
