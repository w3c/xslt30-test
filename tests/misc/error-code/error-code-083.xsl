<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:key - bad key name -->
<?spec xslt#errors?><?error XTSE0020?>


  <xsl:key name="foo::bar" match="doc" use="17"/>

  <xsl:template match="doc">
    <out>
      <xsl:copy/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>