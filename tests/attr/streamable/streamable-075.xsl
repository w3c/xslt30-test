<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:g="http://www.w3.org/xsl-tests/grouped-transactions"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, compute count over the atomized value -->
   
  <xsl:mode streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
  
  <xsl:import-schema namespace="http://www.w3.org/xsl-tests/grouped-transactions" schema-location="grouped-transactions.xsd"/>

  <xsl:strip-space elements="*"/>
    
  <xsl:template name="main">
    <out>
      <xsl:apply-templates select="doc('grouped-transactions.xml')"/>
    </out>
  </xsl:template>
   
  <xsl:template match="g:account">
    <g:transactions number="{count(data(g:transaction/@value))}"/>
  </xsl:template>
    
</xsl:transform>

