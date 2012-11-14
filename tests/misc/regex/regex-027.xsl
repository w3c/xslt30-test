<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

 <?spec xslt#analyze-string?>
  <!-- PURPOSE: test empty non-matching-substring element. -->
  
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <out>;
      <xsl:analyze-string select="doc" regex="e">
       <xsl:matching-substring>[<xsl:value-of select="."/>]</xsl:matching-substring>
       <xsl:non-matching-substring/>
      </xsl:analyze-string>      
    </out>
  </xsl:template>

</xsl:stylesheet>