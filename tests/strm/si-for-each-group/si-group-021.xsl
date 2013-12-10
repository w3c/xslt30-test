<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within xsl:stream, use xsl:for-each-group group-adjacent, inspection reference to first-in-group only-->

  <xsl:template name="main">
    <xsl:stream href="../docs/transactions.xml">
     <out>
      <xsl:for-each-group select="/account/transaction"
         group-adjacent="@date"
         bind-group="g"
         bind-grouping-key="k">
         <g val="{@value}"/>
      </xsl:for-each-group> 
     </out>
    </xsl:stream>
  </xsl:template> 

       
</xsl:transform>

