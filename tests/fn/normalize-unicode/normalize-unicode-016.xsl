<?xml version="1.0" encoding="iso-8859-1"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes" encoding="iso-8859-1"/>

  <!-- trivial test of normalized output (XHTML, result-document, NFC) -->
  <?spec ser#normalization-form?>
  
  <xsl:template match="/">
  <xsl:result-document method="xhtml" normalization-form="NFC">
  <html>
    <xsl:copy-of select="."/>
  </html>
  </xsl:result-document>  
  </xsl:template>
    

</xsl:stylesheet>
