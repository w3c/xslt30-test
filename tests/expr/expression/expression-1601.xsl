<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
>

<xsl:output indent="yes"/>
<!-- test escape-html-uri function -->
<?spec fo#func-escape-html-uri?>

<xsl:template match="/">
  <escape>
    <xsl:for-each select="doc/a">
      <e><xsl:value-of select="escape-html-uri(.)"/></e>
    </xsl:for-each>
  </escape>                             
</xsl:template>
 
</xsl:stylesheet>
