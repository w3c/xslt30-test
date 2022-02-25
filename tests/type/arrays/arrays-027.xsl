<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   exclude-result-prefixes="#all" version="4.0" expand-text="false">

  <xsl:template name="xsl:initial-template">
    <xsl:variable name="result" as="map(*)">
      <xsl:map>
        <xsl:for-each-group array="json-doc('city_list.json')" group-by="?value?country">
          <xsl:map-entry key="current-grouping-key()">
             <xsl:sequence select="current-group()"/>
          </xsl:map-entry>
        </xsl:for-each-group>
    </xsl:map>
    </xsl:variable>
    <out CD="{count($result?CD)}" DE="{count($result?DE)}"/>
  </xsl:template>
  
</xsl:stylesheet>