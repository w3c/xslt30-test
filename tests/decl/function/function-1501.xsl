<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="xs">
 <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="yes" />
 <xsl:template match="doc">
  <!-- Testing fn:available-enironment-variables#0 and fn:available-enironment-variable#1-->
  <?spec fo#func-available-enironment-variables?>
  <?spec fo#func-get-available-enironment-variable?>
  <xsl:variable name="test"/>
  <x>
<out><xsl:value-of select="exists(available-environment-variables())"/></out>
<out>
 <xsl:for-each select="available-environment-variables()">
 <xsl:if test="environment-variable(.) =''" >
false
</xsl:if> 
</xsl:for-each>true</out>
</x>
 </xsl:template>
</xsl:stylesheet>
