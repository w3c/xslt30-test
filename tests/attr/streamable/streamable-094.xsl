<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

    <xsl:output indent="no"/>
    <xsl:strip-space elements="chapter"/>
  
    <!-- apply-templates in the form doc(x)//x -->
    
    <xsl:mode name="s" streamable="yes"/>
    
    <xsl:template name="main">
    <out>
      <xsl:apply-templates select="doc('ot.xml')//book" mode="s"/>
    </out>
    </xsl:template>
    
    <xsl:template match="*" mode="s">
      <xsl:copy>
        <xsl:apply-templates mode="s"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/" mode="s">
      <xsl:copy>
        <xsl:apply-templates mode="s"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="v" mode="s"/>
  
</xsl:stylesheet>