<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">


  <!-- PURPOSE: test use-when expression calling generate-id() function (should SUCCEED in XSLT 3.0). -->
  <?spec xslt#conditional-inclusion?>

  <xsl:template match="/">
    <out>
      <xsl:apply-templates />
    </out>
  </xsl:template>
  
  <xsl:template match="para" use-when="generate-id(()) != ''">
    <p><xsl:next-match/></p>
  </xsl:template>
  
</xsl:stylesheet>