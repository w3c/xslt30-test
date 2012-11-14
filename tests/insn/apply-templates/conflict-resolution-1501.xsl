<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?spec xslt#current-function?>
<!-- Test use of current() in a positional pattern, in a step other than the last (XSLT 2.0) -->

<xsl:template match="*">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>
  
<xsl:template match="*[name()=name(current())][2]/*">
<xsl:copy><xsl:attribute name="parent-recursive">yes</xsl:attribute>
<xsl:apply-templates/></xsl:copy>
</xsl:template>

</xsl:stylesheet>
