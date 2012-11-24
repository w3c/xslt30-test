<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
       
  
    <!-- within a streaming template, use apply-templates to select overlapping elements -->
     
    <xsl:mode name="s" streamable="yes"/>
         
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
      
    <xsl:template name="main" match="/">
      <out>
        <xsl:apply-templates select="doc('sections.xml')" mode="s"/>
      </out>
    </xsl:template>
    
    <xsl:template match="book" mode="s">
      <chap>
        <xsl:apply-templates select=".//section" mode="s"/>
      </chap>
    </xsl:template>
    
    <xsl:template match="section" mode="s">
      <section id="{@id}" author="{author}"/>
    </xsl:template>
    
         
</xsl:transform>
