<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:key - bad match attribute -->
<?spec xslt#errors?><?error XTSE0340?>

  <xsl:key name="key1" use="doc" match="namespace::*"/>

  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>