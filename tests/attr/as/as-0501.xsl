<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.mytest.net"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test with global xsl:variable where @select has an xs:untypedAtomic value and 
  				@as is a built-in atomic type. Verify the variable is of the type specified in @as.
				Values for @as tested: all built-in primitive types, xs:integer, 
				xs:dayTimeDuration, xs:yearMonthDuration  -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:variable name="var1" select="/doc/item1" as="xs:duration"/>

   <xslt:variable name="var2" select="/doc/item2" as="xs:duration"/>

   <xslt:variable name="var3" select="/doc/item3" as="xs:dateTime"/>

   <xslt:variable name="var4" select="/doc/item4" as="xs:dateTime"/>

   <xslt:variable name="var5" select="/doc/item5" as="xs:time"/>

   <xslt:variable name="var6" select="/doc/item6" as="xs:time"/>

   <xslt:variable name="var7" select="/doc/item7" as="xs:date"/>

   <xslt:variable name="var8" select="/doc/item8" as="xs:date"/>

   <xslt:variable name="var9" select="/doc/item9" as="xs:gYearMonth"/>

   <xslt:variable name="var10" select="/doc/item10" as="xs:gYearMonth"/>

   <xslt:variable name="var11" select="/doc/item11" as="xs:gYear"/>

   <xslt:variable name="var12" select="/doc/item12" as="xs:gYear"/>

   <xslt:variable name="var13" select="/doc/item13" as="xs:gMonthDay"/>

   <xslt:variable name="var14" select="/doc/item14" as="xs:gMonthDay"/>

   <xslt:variable name="var15" select="/doc/item15" as="xs:gDay"/>

   <xslt:variable name="var16" select="/doc/item16" as="xs:gDay"/>

   <xslt:variable name="var17" select="/doc/item17" as="xs:gMonth"/>

   <xslt:variable name="var18" select="/doc/item18" as="xs:gMonth"/>

   <xslt:variable name="var19" select="/doc/item19" as="xs:boolean"/>

   <xslt:variable name="var20" select="/doc/item20" as="xs:base64Binary"/>

   <xslt:variable name="var21" select="/doc/item21" as="xs:hexBinary"/>

   <xslt:variable name="var22" select="/doc/item22" as="xs:float"/>

   <xslt:variable name="var23" select="/doc/item23" as="xs:float"/>

   <xslt:variable name="var24" select="/doc/item24" as="xs:decimal"/>

   <xslt:variable name="var25" select="/doc/item25" as="xs:decimal"/>

   <xslt:variable name="var26" select="/doc/item26" as="xs:decimal"/>

   <xslt:variable name="var27" select="/doc/item27" as="xs:double"/>

   <xslt:variable name="var28" select="/doc/item28" as="xs:double"/>

   <xslt:variable name="var29" select="/doc/item29" as="xs:double"/>

   <xslt:variable name="var30" select="/doc/item30" as="xs:integer"/>

   <xslt:variable name="var31" select="/doc/item31" as="xs:integer"/>

   <xslt:variable name="var32" select="/doc/item32" as="xs:anyURI"/>

   <xslt:variable name="var34" select="/doc/item34" as="xs:dayTimeDuration"/>

   <xslt:variable name="var35" select="/doc/item35" as="xs:dayTimeDuration"/>

   <xslt:variable name="var36" select="/doc/item36" as="xs:yearMonthDuration"/>

   <xslt:variable name="var37" select="/doc/item37" as="xs:yearMonthDuration"/>

   <xslt:variable name="var38" select="/doc/item38" as="xs:string"/>

   <xslt:template match="/doc">
      <out>
         <xslt:text>
</xslt:text>
         <var1>
            <xslt:value-of select="$var1 instance of xs:duration"/>
         </var1>
         <xslt:text>
</xslt:text>
         <var2>
            <xslt:value-of select="$var2 instance of xs:duration"/>
         </var2>
         <xslt:text>
</xslt:text>
         <var3>
            <xslt:value-of select="$var3 instance of xs:dateTime"/>
         </var3>
         <xslt:text>
</xslt:text>
         <var4>
            <xslt:value-of select="$var4 instance of xs:dateTime"/>
         </var4>
         <xslt:text>
</xslt:text>
         <var5>
            <xslt:value-of select="$var5 instance of xs:time"/>
         </var5>
         <xslt:text>
</xslt:text>
         <var6>
            <xslt:value-of select="$var6 instance of xs:time"/>
         </var6>
         <xslt:text>
</xslt:text>
         <var7>
            <xslt:value-of select="$var7 instance of xs:date"/>
         </var7>
         <xslt:text>
</xslt:text>
         <var8>
            <xslt:value-of select="$var8 instance of xs:date"/>
         </var8>
         <xslt:text>
</xslt:text>
         <var9>
            <xslt:value-of select="$var9 instance of xs:gYearMonth"/>
         </var9>
         <xslt:text>
</xslt:text>
         <var10>
            <xslt:value-of select="$var10 instance of xs:gYearMonth"/>
         </var10>
         <xslt:text>
</xslt:text>
         <var11>
            <xslt:value-of select="$var11 instance of xs:gYear"/>
         </var11>
         <xslt:text>
</xslt:text>
         <var12>
            <xslt:value-of select="$var12 instance of xs:gYear"/>
         </var12>
         <xslt:text>
</xslt:text>
         <var13>
            <xslt:value-of select="$var13 instance of xs:gMonthDay"/>
         </var13>
         <xslt:text>
</xslt:text>
         <var14>
            <xslt:value-of select="$var14 instance of xs:gMonthDay"/>
         </var14>
         <xslt:text>
</xslt:text>
         <var15>
            <xslt:value-of select="$var15 instance of xs:gDay"/>
         </var15>
         <xslt:text>
</xslt:text>
         <var16>
            <xslt:value-of select="$var16 instance of xs:gDay"/>
         </var16>
         <xslt:text>
</xslt:text>
         <var17>
            <xslt:value-of select="$var17 instance of xs:gMonth"/>
         </var17>
         <xslt:text>
</xslt:text>
         <var18>
            <xslt:value-of select="$var18 instance of xs:gMonth"/>
         </var18>
         <xslt:text>
</xslt:text>
         <var19>
            <xslt:value-of select="$var19 instance of xs:boolean"/>
         </var19>
         <xslt:text>
</xslt:text>
         <var20>
            <xslt:value-of select="$var20 instance of xs:base64Binary"/>
         </var20>
         <xslt:text>
</xslt:text>
         <var21>
            <xslt:value-of select="$var21 instance of xs:hexBinary"/>
         </var21>
         <xslt:text>
</xslt:text>
         <var22>
            <xslt:value-of select="$var22 instance of xs:float"/>
         </var22>
         <xslt:text>
</xslt:text>
         <var23>
            <xslt:value-of select="$var23 instance of xs:float"/>
         </var23>
         <xslt:text>
</xslt:text>
         <var24>
            <xslt:value-of select="$var24 instance of xs:decimal"/>
         </var24>
         <xslt:text>
</xslt:text>
         <var25>
            <xslt:value-of select="$var25 instance of xs:decimal"/>
         </var25>
         <xslt:text>
</xslt:text>
         <var26>
            <xslt:value-of select="$var26 instance of xs:decimal"/>
         </var26>
         <xslt:text>
</xslt:text>
         <var27>
            <xslt:value-of select="$var27 instance of xs:double"/>
         </var27>
         <xslt:text>
</xslt:text>
         <var28>
            <xslt:value-of select="$var28 instance of xs:double"/>
         </var28>
         <xslt:text>
</xslt:text>
         <var29>
            <xslt:value-of select="$var29 instance of xs:double"/>
         </var29>
         <xslt:text>
</xslt:text>
         <var30>
            <xslt:value-of select="$var30 instance of xs:integer"/>
         </var30>
         <xslt:text>
</xslt:text>
         <var31>
            <xslt:value-of select="$var31 instance of xs:integer"/>
         </var31>
         <xslt:text>
</xslt:text>
         <var32>
            <xslt:value-of select="$var32 instance of xs:anyURI"/>
         </var32>
         <xslt:text>
</xslt:text>
         <var34>
            <xslt:value-of select="$var34 instance of xs:dayTimeDuration"/>
         </var34>
         <xslt:text>
</xslt:text>
         <var35>
            <xslt:value-of select="$var35 instance of xs:dayTimeDuration"/>
         </var35>
         <xslt:text>
</xslt:text>
         <var36>
            <xslt:value-of select="$var36 instance of xs:yearMonthDuration"/>
         </var36>
         <xslt:text>
</xslt:text>
         <var37>
            <xslt:value-of select="$var37 instance of xs:yearMonthDuration"/>
         </var37>
         <xslt:text>
</xslt:text>
         <var38>
            <xslt:value-of select="$var38 instance of xs:string"/>
         </var38>
      </out>
   </xslt:template>
</xslt:transform>
