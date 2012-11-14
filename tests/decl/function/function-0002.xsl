<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="xs">
 <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="yes" />
 
 <!-- basic test of first-class functions -->
 
 <xsl:template name="main">
    <x>
      <xsl:variable name="absf" as="function(*)" select="abs#1"/>
      <a><xsl:value-of select="$absf(-2)"/></a>
      <b><xsl:value-of select="function-name($absf)"/></b>
      <c><xsl:value-of select="function-arity($absf)"/></c>
      <d><xsl:value-of select="count($absf)"/></d>         
    </x>
 </xsl:template>
</xsl:stylesheet>
