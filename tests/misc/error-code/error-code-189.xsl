<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: Cannot specify tunnel="yes on a function parameter -->
<?spec xpath#errors?><?error XTSE0020?>

  <xsl:template match="doc">
    <out/>
  </xsl:template>
  
  <xsl:function name="f:x" xmlns:f="http://f/com">
     <xsl:param name="p" tunnel="yes"/>
     <xsl:sequence select="2"/>
  </xsl:function>

</xsl:stylesheet>