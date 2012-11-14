<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 	<xsl:output method="xml" version="2.0" encoding="UTF-8" 
 indent="yes"/>
 
 <!-- variable declared as child of xsl:apply-imports -->
 <?spec xslt#errors?><?error XTSE0010?>
 
 
    <xsl:template match="/">
      <result>
        <xsl:apply-imports>
          <xsl:variable name="x" select="3"/>
          <xsl:with-param name="y" select="$x"/>
        </xsl:apply-imports>
      </result>
    </xsl:template>

</xsl:stylesheet>

