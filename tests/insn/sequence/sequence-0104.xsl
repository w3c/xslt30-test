<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- PURPOSE:   Test sequence construction of parentless elements,
     followed by attachment to a new element -->
<?spec xslt#variable-values?>

<xsl:output indent="yes"/>

<xsl:template match="doc">
  <xsl:variable name="q" as="element() *">
    <a>1</a>
    <b>2</b>
    <c>3</c>
  </xsl:variable>
  <zzz><xsl:copy-of select="$q"/></zzz>
</xsl:template>
 
</xsl:stylesheet>
