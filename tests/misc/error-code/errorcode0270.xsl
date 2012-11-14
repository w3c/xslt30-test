<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTRE0270?>
<!-- Either signals the error, or reports two (whitespace) text nodes -->

<xsl:strip-space elements="doc"/>

  <xsl:template name="main">
    <out>
      <xsl:apply-templates/>
    </out>
  </xsl:template>
  
<xsl:preserve-space elements="doc"/>

<xsl:template match="doc">
    <xsl:value-of select="count(text())"/>
</xsl:template>


</xsl:stylesheet>