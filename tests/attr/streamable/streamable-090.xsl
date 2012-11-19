<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
       
  
    <!-- within a streaming template, evaluate a general comparison on streamed nodes -->
    <!-- same as streamable-089, with the operands of "=" reversed -->
    
     
    <xsl:mode name="s" streamable="yes"/>
    <xsl:strip-space elements="*"/>
         
    <xsl:output method="xml" indent="yes" encoding="UTF-8" />
      
    <xsl:template name="main" match="/">
      <out>
        <xsl:apply-templates select="doc('loans.xml')" mode="s"/>
      </out>
    </xsl:template>
    
    <xsl:template match="Property" mode="s">
        <IsCalifornia><xsl:value-of select="'CA' = Address/State"/></IsCalifornia>
    </xsl:template>
    
    <xsl:template match="text()" mode="#all"/>
         
</xsl:transform>

