<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
       
  
    <!-- within a streaming template, use if/then/else for conditional processing -->
    <!-- action depends on down-content, condition does not -->
    
     
    <xsl:mode name="s" streamable="yes"/>
    <xsl:strip-space elements="*"/>
         
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
      
    <xsl:template name="main" match="/">
      <out>
        <xsl:source-document streamable="true" href="loans.xml"><xsl:apply-templates select="." mode="s"/></xsl:source-document>
      </out>
    </xsl:template>
    
    <xsl:template match="Property" mode="s">
      <Property>
        <xsl:copy-of select="if (lang('en')) then Address else if (lang('de')) then PropertyPurchase else ()"/>
      </Property>
    </xsl:template>
    
    <xsl:template match="text()" mode="#all"/>
         
</xsl:transform>

