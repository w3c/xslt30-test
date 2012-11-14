<?xml version="1.0" encoding="iso-8859-1"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" encoding="iso-8859-1"/>

  <!-- trivial test of normalized output (html, NFKD) -->
  <?spec ser#normalization-form?>
  
  <xsl:output method="html" normalization-form="NFKD"/>
  <xsl:template match="/">
  <html>
    <head><title>Normalised text</title></head>
    <body>
    <xsl:apply-templates select="/doc/*"/>
    </body>
  </html>  
  </xsl:template>
  
  
  <xsl:template match="en|de|ffi">
    <p>
      <xsl:for-each select="@*">
      <li><xsl:value-of select="."/></li>
      </xsl:for-each>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>
    

</xsl:stylesheet>
