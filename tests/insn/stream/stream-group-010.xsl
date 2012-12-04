<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
  
  <!-- streaming, xsl:for-each-group group-adjacent, multi-level grouping -->
  
  <xsl:mode name="s" streamable="yes"/>
    
  <xsl:template name="main">
    <xsl:stream href="transactions.xml">
      <xsl:apply-templates select="account" mode="s"/>
    </xsl:stream>
  </xsl:template> 


  <xsl:template match="account" mode="s">
     <out>
      <xsl:for-each-group select="transaction"
         group-adjacent="year-from-date(xs:date(@date))"
         composite="no"
         bind-group="g"
         bind-grouping-key="k">
         <batch year="{$k}">
           <xsl:for-each-group select="$g" group-adjacent="format-date(xs:date(@date), '[W]')" 
             bind-group="h" bind-grouping-key="l">
             <week nr="{$l}">
                <xsl:copy-of select="$h"/>
             </week>
           </xsl:for-each-group>
         </batch>
      </xsl:for-each-group> 
    </out>
  </xsl:template>   
  

       
</xsl:transform>

