<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<!-- test xsl:copy on-empty - non empty PI node -->

    
<xsl:template match="/">
  <xsl:variable name="var1" as="node()"><xsl:processing-instruction name="go" select="'Boo!'"/></xsl:variable>
  <out>
    <xsl:conditional-content>
      <xsl:copy select="$var1"/>
    </xsl:conditional-content>  
  </out>  
</xsl:template>

</xsl:stylesheet>