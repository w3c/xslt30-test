<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="2.1">
       
  
  <!-- two input documents processed in streaming mode -->
   
  <xsl:mode streamable="yes"/>
  <xsl:mode name="t" streamable="yes"/>
       
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />

  <xsl:strip-space elements="*"/>
    
  <xsl:template name="main">
    <out>
      <xsl:apply-templates select="doc('mixed.xml')">
        <xsl:with-param name="p" select="17" tunnel="yes"/> 
      </xsl:apply-templates>
    </out>
  </xsl:template>
  
  <xsl:template match="/">
      <xsl:variable name="v" as="element()*">
        <xsl:apply-templates select="doc('strmode061.xml')" mode="t"/>
      </xsl:variable>
      <xsl:apply-templates>
        <xsl:with-param name="q" select="$v" tunnel="yes"/> 
      </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="title" mode="t">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  
  <xsl:template match="text()" mode="#default t"/>
   
  <xsl:template match="bktlong">
    <xsl:param name="p" tunnel="yes" required="yes" as="xs:integer"/>
    <xsl:param name="q" tunnel="yes" required="yes" as="element(title)*"/>
    <bktlong p="{$p}">
      <t1><xsl:value-of select="."/></t1>
      <xsl:sequence select="$q"/>
    </bktlong>
  </xsl:template>
 
    
</xsl:transform>

