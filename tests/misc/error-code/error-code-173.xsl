<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<!-- error in included stylesheet -->
<?spec xslt#errors?><?error XTSE0165?>

<xsl:include href="xerror235.xsl"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>

