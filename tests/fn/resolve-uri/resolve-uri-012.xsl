<?xml version="1.0"?>
<?spec fo#func-static-base-uri?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Test the static-base-uri() function with no parameters -->

<xsl:output method="xml" indent="yes"/>

<xsl:template match="doc" xml:base="file:///TestInputs/reluri/reluri12.xsl">
  <out>
    <xsl:value-of select="static-base-uri()"/>
  </out>
</xsl:template>

</xsl:stylesheet>
