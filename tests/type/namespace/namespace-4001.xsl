<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://testguys.com/" xmlns:ped="http://www.test.com">

<?spec xslt#xsl-element?>
    <!-- Purpose: Use "plain" xsl:element while both default and prefixed NS defined at top. -->

<xsl:template match="doc">
  <out>
    <xsl:element name="inner"/>
  </out>
</xsl:template>

</xsl:stylesheet>
