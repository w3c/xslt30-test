<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:f="function"
               exclude-result-prefixes="#all"
               version="3.0">

   <xsl:output method="xml" />

   <xsl:mode streamable="yes" />

   <xsl:accumulator name="item-cost" streamable="yes" 
       as="xs:integer" 
       initial-value="0">
       <xsl:accumulator-rule match="cost/text()">
         <xsl:sequence select="$value + xs:integer(.)"/>
       </xsl:accumulator-rule>  
   </xsl:accumulator>

   <xsl:template match="purchase-order">
       <Total-Cost>
           <items><xsl:value-of select="count(//item)"/></items>
           <cost><xsl:value-of select="accumulator-after('item-cost')" /></cost>
       </Total-Cost>
   </xsl:template>

</xsl:stylesheet>