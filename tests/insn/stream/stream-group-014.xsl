<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
  
  <!-- streaming, xsl:for-each-group group-adjacent, as a direct child of xsl:stream -->
  
  <xsl:template name="main">
    <out>
      <xsl:stream href="transactions.xml">
        <xsl:for-each-group select="account/transaction"
         group-adjacent="year-from-date(xs:date(@date)), format-date(xs:date(@date), '[W]')"
         composite="yes"
         bind-group="g"
         bind-grouping-key="k">
         <batch year="{$k[1]}" week="{$k[2]}">
            <total><xsl:value-of select="sum($g/xs:decimal(@value))"/></total>
         </batch>
        </xsl:for-each-group> 
      </xsl:stream>
    </out>  
  </xsl:template> 

       
</xsl:transform>

