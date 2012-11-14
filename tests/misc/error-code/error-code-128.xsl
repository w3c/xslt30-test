<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:call-template - bad content -->
<?spec xslt#errors?><?error XTSE0010?>

<xsl:template name="x">
         <xsl:param name="a:y" select="3" xmlns:a="http://a.uri/"/>
         <xsl:param name="b:yyy" select="4" xmlns:b="http://a.uri/"/>
</xsl:template>
  
  <xsl:template match="doc">
    <out>
      <xsl:call-template name="x">
         <xsl:sort select="@fred"/>
         <xsl:with-param name="a:y" select="3" xmlns:a="http://a.uri/"/>
         <xsl:with-param name="b:yyy" select="4" xmlns:b="http://a.uri/"/>
      </xsl:call-template>  
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>




</xsl:stylesheet>