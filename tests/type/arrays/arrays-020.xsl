<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
   exclude-result-prefixes="xs math" version="4.0" expand-text="true">
  
  <xsl:template name="xsl:initial-template">
    <out>
      <xsl:for-each array="[1, (5,6), 10]">
         <in>{sum(?value)}</in>
      </xsl:for-each>
    </out>
  </xsl:template>
  
</xsl:stylesheet>