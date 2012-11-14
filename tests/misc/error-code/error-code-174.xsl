<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 	<xsl:output method="xml" version="2.0" encoding="UTF-8" 
 indent="yes"/>
 
 <!-- xsl:stylesheet not at top level -->
 <?spec xslt#errors?><?error XTSE0010?>
 
    <xsl:template match="/">
      <result>
        <xsl:attribute name="test_attr">
          <xsl:stylesheet version="1.0">xsl:stylesheet</xsl:stylesheet>
        </xsl:attribute>
      </result>
    </xsl:template>

</xsl:stylesheet>

