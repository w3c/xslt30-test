<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<?spec xslt#constructing-sequences?>
<?spec fo#func-reverse?>
<!-- PURPOSE:   Test xsl:sequence adding atomic values to an element -->

<xsl:output indent="yes"/>

<xsl:template match="doc">
    <zzz>
      <xsl:sequence select="1 to 5"/>
      <x/>
      <xsl:sequence select="reverse(1 to 5)"/>
    </zzz>
</xsl:template>
 
</xsl:stylesheet>
