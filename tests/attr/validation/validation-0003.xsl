<?xml version="1.0"?>
<xsl:stylesheet version="3.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs">

<?spec xslt#validation-xsl-type?>

<!-- No validation takes place if there is an on-error attribute (XSLT 3.0) -->

<xsl:param name="p" select="''"/>

<xsl:template name="main">
  <out>
    <xsl:attribute name="wrong" type="xs:integer" select="$p" on-empty="'empty'"/>
  </out>
</xsl:template>


</xsl:stylesheet>
