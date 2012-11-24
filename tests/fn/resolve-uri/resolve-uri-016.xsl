<?xml version="1.0"?>
<?spec fo#func-document-uri?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Test the document-uri() function -->

<xsl:output method="xml" indent="yes"/>

<xsl:variable name="x"><x/></xsl:variable>

<xsl:template match="doc" xml:base="http://no.other/home/">
  <out>
    <a><xsl:value-of select="substring-after(document-uri(/), '/TestInputs')"/></a>
    <a><xsl:value-of select="document-uri($x)"/></a>              
  </out>
</xsl:template>

</xsl:stylesheet>