<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://accum004/"
    exclude-result-prefixes="xs f"
    version="3.0">
    
    <!-- Use accumulators to compute min, max, sum, avg, and count in parallel -->
    
   <xsl:accumulator name="f:count" post-descent="f:count_" as="xs:integer" initial-value="0">
     <xsl:accumulator-rule match="transaction" new-value="$value + 1"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="f:sum" post-descent="f:sum_" as="xs:double" initial-value="0">
     <xsl:accumulator-rule match="transaction" new-value="$value + @amount"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="f:min" post-descent="f:min_" as="xs:double" initial-value="999999999999">
     <xsl:accumulator-rule match="transaction" new-value="if (@amount &lt; $value) then @amount else $value"/>
   </xsl:accumulator>
   
   <xsl:accumulator name="f:max" post-descent="f:max_" as="xs:double" initial-value="-999999999999">
     <xsl:accumulator-rule match="transaction" new-value="if (@amount &gt; $value) then @amount else $value"/>
   </xsl:accumulator>
   
   
   <xsl:mode streamable="no" on-no-match="shallow-skip"/>
   <xsl:template match="/">
     <result min="{f:min_()}" max="{f:max_()}" sum="{f:sum_()}" count="{f:count_()}" avg="{round(f:sum_() div f:count_(), 2)}"/> 
   </xsl:template>  
    
</xsl:stylesheet>