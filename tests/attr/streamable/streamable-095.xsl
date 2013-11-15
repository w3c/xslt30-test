<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
       
  
    <!-- within a streaming template, use xsl:iterate to process the subtree -->
     
    <xsl:mode name="s" streamable="yes"/>
         
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
    
    <xsl:param name="sep" select="'|'" as="xs:string"/>
     
    <xsl:template name="main" match="/">
      <out>
        <xsl:stream href="loans.xml">
          <xsl:apply-templates select="/*/ACERequest" mode="s"/>
        </xsl:stream>  
      </out>
    </xsl:template>
    
    <xsl:template match="ACERequest" mode="s">
      <loans>
        <xsl:iterate select=".//UnpaidPrincipalBalanceAmount">
          <xsl:param name="acc" as="xs:decimal" select="0.00"/>
          <xsl:variable name="loan" select="xs:decimal(.)"/>
          <xsl:variable name="newAcc" as="xs:decimal" select="$acc + $loan"/>
          <loan value="{$loan}" cumulativeValue="{$newAcc}"/>
          <xsl:next-iteration>
             <xsl:with-param name="acc" select="$newAcc"/>
          </xsl:next-iteration>
        </xsl:iterate>
      </loans>
    </xsl:template>
       
</xsl:transform>

