<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="xs">
 <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
 
  
 <xsl:template match="/" name="main">
  <!-- Testing fn:format-integer#2-->
  <?spec fo#func-format-integer?>
  <out>
  <a><xsl:value-of select="format-integer(1 ,'0')"/></a>
  <b><xsl:value-of select="format-integer(11 ,'#0')"/></b>
  <c><xsl:value-of select="format-integer(1230 ,'#,000')"/></c>
  </out>
  </xsl:template>
</xsl:stylesheet>
