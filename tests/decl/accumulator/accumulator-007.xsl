<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://accum004/"
    exclude-result-prefixes="xs f"
    version="3.0">
    
    <xsl:param name="applies-to" static="yes" select="'transactions'"/>
    <xsl:param name="streamable" static="yes" select="'no'"/>
    <xsl:param name="initial-count" static="yes" select="'0'"/>
    
    <!-- Use accumulators to compute min, max, sum, avg, and count in parallel -->
    <!-- Also tests @applies-to -->
    
   <xsl:accumulator name="count"  as="xs:integer" _initial-value="{$initial-count}" 
   					applies-to="transactions" _streamable="{$streamable}">
     <xsl:accumulator-rule match="transaction" new-value="$value + 1"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="sum"  as="xs:double" initial-value="0" 
   					applies-to="transactions" _streamable="{$streamable}">
     <xsl:accumulator-rule match="transaction" new-value="$value + @amount"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="min"  as="xs:double" initial-value="999999999999" 
   					_applies-to="{$applies-to}" _streamable="{$streamable}">
     <xsl:accumulator-rule match="transaction" new-value="if (@amount &lt; $value) then @amount else $value"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="max" as="xs:double" initial-value="-999999999999" 
   					_applies-to="{$applies-to}" _streamable="{$streamable}">
     <xsl:accumulator-rule match="transaction" new-value="if (@amount &gt; $value) then @amount else $value"/>
   </xsl:accumulator>
   
   
   <xsl:mode _streamable="{$streamable}" on-no-match="deep-skip"/>
   <xsl:template match="/">
     <xsl:apply-templates/>
     <result min="{accumulator-after('min')}" max="{accumulator-after('max')}" 
             sum="{accumulator-after('sum')}" count="{accumulator-after('count')}" 
             avg="{round(accumulator-after('sum') div accumulator-after('count'), 2)}"/> 
   </xsl:template>  
    
</xsl:stylesheet>