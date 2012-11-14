<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

<!-- PURPOSE:  "." used when not a node - optionally a static error even though never executed -->
<?spec xpath#errors?><?error XTTE0520?>

<xsl:template match="/">
<a>***** error not detected! *****</a>
</xsl:template>

<xsl:function name="f:doc" xmlns:f="http://f.com/">
  <xsl:for-each select="1 to 5">
    <xsl:apply-templates select="."/>
  </xsl:for-each>
</xsl:function>
</xsl:stylesheet>