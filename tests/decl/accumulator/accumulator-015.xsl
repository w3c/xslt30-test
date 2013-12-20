<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:f="function"
               exclude-result-prefixes="#all"
               version="3.0">

   <xsl:output method="xml" />

   <xsl:mode streamable="yes" />

   <xsl:accumulator name="f:item-cost" 
       post-descent="f:total-item-cost" 
       as="xs:integer" 
       initial-value="0">
       <xsl:accumulator-rule match="cost" new-value="$value + xs:integer(.)"/>
   </xsl:accumulator>

   <xsl:template match="purchase-order">
       <Total-Cost>
           <xsl:for-each select="item">
               <xsl:for-each select="cost"/>
           </xsl:for-each>
           <xsl:value-of select="f:total-item-cost()" />
       </Total-Cost>
   </xsl:template>

</xsl:stylesheet>