<?xml version="1.0"?>
<?spec xslt#number?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- test xsl:number with different values of lang attribute in a single run -->

<xsl:output method="xml" indent="no" encoding="UTF-8"/>

<xsl:template match="doc">
  <out>
    <xsl:apply-templates/>
  </out>
</xsl:template>

<xsl:template match="note">
  <xsl:number value="position()" format="Ww " lang="{if (position() mod 2 = 0) then 'en' else 'de'}" />
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>