<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="xs">
 <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
 
 
 
 
 <xsl:template match="/">
  <out>
   <xsl:apply-templates />
  </out>
 </xsl:template>
 
 
 <xsl:template match="doc">
  <!-- Testing fn:format-integer#2-->
  <?spec fo#func-format-integer?>
 <xsl:for-each select="a">
<a><xsl:value-of select="format-integer(. ,'1','de' cast as xs:language)"/></a>   
 </xsl:for-each>
  <xsl:for-each select="a">
   <a><xsl:value-of select="format-integer(. ,'Ww')"/></a>   
  </xsl:for-each>
  <xsl:for-each select="a">
   <a><xsl:value-of select="format-integer(. ,'A')"/></a>   
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
