<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' 
xmlns:saxon="http://icl.com/saxon" extension-element-prefixes="saxon" 
version="2.0">

<?spec xpath#id-path-expressions?>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <all>
    <xsl:apply-templates select="//source"/>
  </all>
</xsl:template>

<xsl:template match="source">
     <xsl:apply-templates select="//GGG/preceding::*" mode="printName"/>
</xsl:template>

<xsl:template match="*" mode="printName">
   <element><xsl:value-of select="name()"/></element>
</xsl:template>

</xsl:stylesheet>