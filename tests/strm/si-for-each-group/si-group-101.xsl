<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
  
  <!-- streaming, xsl:for-each-group using group-starting-with -->
  
  <xsl:mode name="s" streamable="yes"/>
    
  <xsl:template name="main">
    <xsl:stream href="../docs/transactions.xml">
      <xsl:apply-templates select="account" mode="s"/>
    </xsl:stream>
  </xsl:template> 


  <xsl:template match="account" mode="s">
     <out>
      <xsl:for-each-group select="transaction"
         group-starting-with="*[@value &lt; 0]" bind-group="g">
         <batch>
           <xsl:copy-of select="$g"/>
         </batch>
      </xsl:for-each-group> 
    </out>
  </xsl:template>   
  

       
</xsl:transform>

