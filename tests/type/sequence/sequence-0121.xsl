<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<?spec xslt#constructing-sequences?>
<?spec xslt#fallback?>
<!-- PURPOSE:   Test xsl:sequence containing xsl:fallback -->

<xsl:output indent="yes"/>

<xsl:template match="doc">
  <zzz>
    <xsl:sequence select="17">
      <xsl:fallback>
        <xsl:value-of select="17"/>
      </xsl:fallback>
    </xsl:sequence>
  </zzz>
</xsl:template>
 
</xsl:stylesheet>
