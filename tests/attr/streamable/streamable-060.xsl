<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, use apply-templates to select overlapping elements -->
   
  <xsl:mode name="s" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
  
  <xsl:param name="sep" select="'|'" as="xs:string"/>
   
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('strmode037.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="chap" mode="s">
    <chap>
      <xsl:apply-templates select=".//section" mode="s"/>
    </chap>
  </xsl:template>
  
  <xsl:template match="section" mode="s">
    <section>
      <xsl:apply-templates select="page-count" mode="s"/>
    </section>
  </xsl:template>
  
  <xsl:template match="page-count" mode="s">
    <pages>
      <xsl:value-of select="."/>
    </pages>  
  </xsl:template>
      
</xsl:transform>

