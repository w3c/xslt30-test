<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- within a streaming template, use apply-templates within an attribute constructor.
       Also tests mode="#current" -->
   
  <xsl:mode name="s" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
    
  <xsl:template name="main" match="/">
    <out>
      <xsl:apply-templates select="doc('strmode061.xml')" mode="s"/>
    </out>
  </xsl:template>
  
  <xsl:template match="book" mode="s">
    <chap>
      <xsl:apply-templates select=".//section" mode="s"/>
    </chap>
  </xsl:template>
  
  <xsl:template match="section" mode="s">
    <section id="{@id}">
      <xsl:attribute name="author">
        <xsl:apply-templates select="author" mode="#current"/>
      </xsl:attribute>
    </section>
  </xsl:template>
  
  <xsl:template match="author" mode="s">
    <xsl:value-of select="."/>
  </xsl:template>
  
       
</xsl:transform>

