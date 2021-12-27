<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
   exclude-result-prefixes="xs math " version="4.0" expand-text="false">

  <xsl:variable name="json" as="xs:string">
    [
      { "city": "London", "latitude": 51.5099, "longitude": -0.1181 },
      { "city": "Paris",  "latitude": 48.8647, "longitude": 2.3488 },
      { "city": "Berlin", "latitude": 52.5200, "longitude": 13.4049 }                  
    ]
  </xsl:variable>
  

  <xsl:template name="xsl:initial-template">
    <out>
      <xsl:for-each array="parse-json($json)">
        <xsl:sort select="?value?city"/>
        <city number="{position()}" 
          name="{?value?city}" 
          latitude="{?value?latitude}" 
          longitude="{?value?longitude}"/>
      </xsl:for-each>
    </out>
  </xsl:template>
  
</xsl:stylesheet>