<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:key - not top-level -->
<?spec xslt#errors?><?error XTSE0010?>


<xsl:variable name="key">
  <xsl:key name="key1" match="doc" use="."/>
</xsl:variable>
  
  <xsl:template match="doc">
    <out>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>

</xsl:stylesheet>