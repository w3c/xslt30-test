<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, use copy-of with a path expression -->
   
  <xsl:import-schema schema-location="loans.xsd"/>

  <xsl:mode name="s" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />

  
    
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('loans.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="*" mode="s">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="s"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="Loan" mode="s">
    <zips>
      <xsl:copy-of select="Property/Address/PostalCode"/>
    </zips>
  </xsl:template>
    
</xsl:transform>

