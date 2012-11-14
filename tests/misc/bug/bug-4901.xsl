<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<?spec fo#func-name?>
<!-- BUG (reported but not reproduced) name() doesn't work on attribute nodes. -->

<xsl:template match="/">
  <testing>
    <xsl:value-of select="doc/@mary"/>
    <xsl:for-each select="//@*">
       <xsl:value-of select="name()"/>;
    </xsl:for-each>
  </testing>
</xsl:template>

</xsl:stylesheet>
