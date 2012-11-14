<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 	<xsl:output method="xml" version="2.0" encoding="UTF-8" 
 indent="yes"/>
 
 <!-- unknown top-level element in XSLT namespace -->
 <?spec xslt#errors?><?error XTSE0010?>
 
    <xsl:unknown-declaration/>
 
    <xsl:template match="/">
      <result>
        12
      </result>
    </xsl:template>

</xsl:stylesheet>

