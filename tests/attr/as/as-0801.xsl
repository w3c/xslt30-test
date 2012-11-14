<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.mytest.net"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test with a sequence of xs:untypedAtomic values in @select of a global xsl:variable and @as is a built-in atomic type with 
  				occurence indicator (*). Verify variable is of type specified in @as. Values for @as tested: all built-in primitive 
  				types (except xs:QName), xs:integer, xs:dayTimeDuration, xs:yearMonthDuration  -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:variable name="var1" select="/doc/item1" as="xs:duration*"/>

   <xslt:variable name="var2" select="/doc/item2" as="xs:dateTime*"/>

   <xslt:variable name="var3" select="/doc/item3" as="xs:time*"/>

   <xslt:variable name="var4" select="/doc/item4" as="xs:date*"/>

   <xslt:variable name="var5" select="/doc/item5" as="xs:gYearMonth*"/>

   <xslt:variable name="var6" select="/doc/item6" as="xs:gYear*"/>

   <xslt:variable name="var7" select="/doc/item7" as="xs:gMonthDay*"/>

   <xslt:variable name="var8" select="/doc/item8" as="xs:gDay*"/>

   <xslt:variable name="var9" select="/doc/item9" as="xs:gMonth*"/>

   <xslt:variable name="var10" select="/doc/item10" as="xs:boolean*"/>

   <xslt:variable name="var11" select="/doc/item11" as="xs:base64Binary*"/>

   <xslt:variable name="var12" select="/doc/item12" as="xs:hexBinary*"/>

   <xslt:variable name="var13" select="/doc/item13" as="xs:float*"/>

   <xslt:variable name="var14" select="/doc/item14" as="xs:decimal*"/>

   <xslt:variable name="var15" select="/doc/item15" as="xs:double*"/>

   <xslt:variable name="var16" select="/doc/item16" as="xs:integer*"/>

   <xslt:variable name="var17" select="/doc/item17" as="xs:anyURI*"/>

   <xslt:variable name="var18" select="/doc/item18" as="xs:dayTimeDuration*"/>

   <xslt:variable name="var19" select="/doc/item19" as="xs:yearMonthDuration*"/>

   <xslt:variable name="var20" select="/doc/item20" as="xs:string*"/>

   <xslt:template match="/doc">
      <out>
         <xslt:text>
</xslt:text>
         <var1>
            <xslt:value-of select="$var1 instance of xs:duration*"/>
            <xslt:value-of select="$var1 instance of xs:duration"/>
         </var1>
         <xslt:text>
</xslt:text>
         <var2>
            <xslt:value-of select="$var2 instance of xs:dateTime*"/>
            <xslt:value-of select="$var2 instance of xs:dateTime"/>
         </var2>
         <xslt:text>
</xslt:text>
         <var3>
            <xslt:value-of select="$var3 instance of xs:time*"/>
            <xslt:value-of select="$var3 instance of xs:time"/>
         </var3>
         <xslt:text>
</xslt:text>
         <var4>
            <xslt:value-of select="$var4 instance of xs:date*"/>
            <xslt:value-of select="$var4 instance of xs:date"/>
         </var4>
         <xslt:text>
</xslt:text>
         <var5>
            <xslt:value-of select="$var5 instance of xs:gYearMonth*"/>
            <xslt:value-of select="$var5 instance of xs:gYearMonth"/>
         </var5>
         <xslt:text>
</xslt:text>
         <var6>
            <xslt:value-of select="$var6 instance of xs:gYear*"/>
            <xslt:value-of select="$var6 instance of xs:gYear"/>
         </var6>
         <xslt:text>
</xslt:text>
         <var7>
            <xslt:value-of select="$var7 instance of xs:gMonthDay*"/>
            <xslt:value-of select="$var7 instance of xs:gMonthDay"/>
         </var7>
         <xslt:text>
</xslt:text>
         <var8>
            <xslt:value-of select="$var8 instance of xs:gDay*"/>
            <xslt:value-of select="$var8 instance of xs:gDay"/>
         </var8>
         <xslt:text>
</xslt:text>
         <var9>
            <xslt:value-of select="$var9 instance of xs:gMonth*"/>
            <xslt:value-of select="$var9 instance of xs:gMonth"/>
         </var9>
         <xslt:text>
</xslt:text>
         <var10>
            <xslt:value-of select="$var10 instance of xs:boolean*"/>
            <xslt:value-of select="$var10 instance of xs:boolean"/>
         </var10>
         <xslt:text>
</xslt:text>
         <var11>
            <xslt:value-of select="$var11 instance of xs:base64Binary*"/>
            <xslt:value-of select="$var11 instance of xs:base64Binary"/>
         </var11>
         <xslt:text>
</xslt:text>
         <var12>
            <xslt:value-of select="$var12 instance of xs:hexBinary*"/>
            <xslt:value-of select="$var12 instance of xs:hexBinary"/>
         </var12>
         <xslt:text>
</xslt:text>
         <var13>
            <xslt:value-of select="$var13 instance of xs:float*"/>
            <xslt:value-of select="$var13 instance of xs:float"/>
         </var13>
         <xslt:text>
</xslt:text>
         <var14>
            <xslt:value-of select="$var14 instance of xs:decimal*"/>
            <xslt:value-of select="$var14 instance of xs:decimal"/>
         </var14>
         <xslt:text>
</xslt:text>
         <var15>
            <xslt:value-of select="$var15 instance of xs:double*"/>
            <xslt:value-of select="$var15 instance of xs:double"/>
         </var15>
         <xslt:text>
</xslt:text>
         <var16>
            <xslt:value-of select="$var16 instance of xs:integer*"/>
            <xslt:value-of select="$var16 instance of xs:integer"/>
         </var16>
         <xslt:text>
</xslt:text>
         <var17>
            <xslt:value-of select="$var17 instance of xs:anyURI*"/>
            <xslt:value-of select="$var17 instance of xs:anyURI"/>
         </var17>
         <xslt:text>
</xslt:text>
         <var18>
            <xslt:value-of select="$var18 instance of xs:dayTimeDuration*"/>
            <xslt:value-of select="$var18 instance of xs:dayTimeDuration"/>
         </var18>
         <xslt:text>
</xslt:text>
         <var19>
            <xslt:value-of select="$var19 instance of xs:yearMonthDuration*"/>
            <xslt:value-of select="$var19 instance of xs:yearMonthDuration"/>
         </var19>
         <xslt:text>
</xslt:text>
         <var20>
            <xslt:value-of select="$var20 instance of xs:string*"/>
            <xslt:value-of select="$var20 instance of xs:string"/>
         </var20>
      </out>
   </xslt:template>
</xslt:transform>
