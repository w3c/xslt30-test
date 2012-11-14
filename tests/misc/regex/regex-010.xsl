<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">


  <!-- PURPOSE: test xf:tokenize() function. -->
  <?spec fo#func-tokenize?>
  
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <out>
    <xsl:variable name="s" select="'12, 14, 3, 17, 24,,5 '"/>
        [<xsl:value-of select="tokenize($s, ',\s*')" separator="|"/>]
    </out>
  </xsl:template>

</xsl:stylesheet>