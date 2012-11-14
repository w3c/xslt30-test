<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">


  <!-- PURPOSE: test replace() with \$ and \\ in replacement string. -->
  <?spec fo#func-replace?>
  
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:param name="in">
      <xsl:text>Some unparsed HTML</xsl:text>
    </xsl:param>
    <out>
        <a><xsl:value-of select='replace($in, "(unparsed)", "\$\\")'/></a>
    </out>
  </xsl:template>

</xsl:stylesheet>