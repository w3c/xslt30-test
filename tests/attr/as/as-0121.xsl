<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.mytest.net"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test with xsl:template which constructs the empty sequence () and @as is a built-in type  
  				use occurence indicator (?). Values for @as tested: all built-in primitive types 
  				(except xs:QName), xs:integer, xs:dayTimeDuration, xs:yearMonthDuration   -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:template match="/doc">
      <out>
         <xslt:text>
</xslt:text>
         <template1>
            <xslt:call-template name="a1"/>
         </template1>
         <xslt:text>
</xslt:text>
         <template3>
            <xslt:call-template name="a3"/>
         </template3>
         <xslt:text>
</xslt:text>
         <template5>
            <xslt:call-template name="a5"/>
         </template5>
         <xslt:text>
</xslt:text>
         <template7>
            <xslt:call-template name="a7"/>
         </template7>
         <xslt:text>
</xslt:text>
         <template9>
            <xslt:call-template name="a9"/>
         </template9>
         <xslt:text>
</xslt:text>
         <template11>
            <xslt:call-template name="a11"/>
         </template11>
         <xslt:text>
</xslt:text>
         <template13>
            <xslt:call-template name="a13"/>
         </template13>
         <xslt:text>
</xslt:text>
         <template15>
            <xslt:call-template name="a15"/>
         </template15>
         <xslt:text>
</xslt:text>
         <template17>
            <xslt:call-template name="a17"/>
         </template17>
         <xslt:text>
</xslt:text>
         <template19>
            <xslt:call-template name="a19"/>
         </template19>
         <xslt:text>
</xslt:text>
         <template20>
            <xslt:call-template name="a20"/>
         </template20>
         <xslt:text>
</xslt:text>
         <template21>
            <xslt:call-template name="a21"/>
         </template21>
         <xslt:text>
</xslt:text>
         <template22>
            <xslt:call-template name="a22"/>
         </template22>
         <xslt:text>
</xslt:text>
         <template24>
            <xslt:call-template name="a24"/>
         </template24>
         <xslt:text>
</xslt:text>
         <template27>
            <xslt:call-template name="a27"/>
         </template27>
         <xslt:text>
</xslt:text>
         <template30>
            <xslt:call-template name="a30"/>
         </template30>
         <xslt:text>
</xslt:text>
         <template32>
            <xslt:call-template name="a32"/>
         </template32>
         <xslt:text>
</xslt:text>
         <template34>
            <xslt:call-template name="a34"/>
         </template34>
         <xslt:text>
</xslt:text>
         <template36>
            <xslt:call-template name="a36"/>
         </template36>
         <xslt:text>
</xslt:text>
         <template38>
            <xslt:call-template name="a38"/>
         </template38>
      </out>
   </xslt:template>

   <xslt:template name="a1" as="xs:duration?">
	     <xslt:sequence select="()"/>	
   </xslt:template>

   <xslt:template name="a3" as="xs:dateTime?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a5" as="xs:time?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a7" as="xs:date?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a9" as="xs:gYearMonth?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a11" as="xs:gYear?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a13" as="xs:gMonthDay?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a15" as="xs:gDay?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a17" as="xs:gMonth?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a19" as="xs:boolean?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a20" as="xs:base64Binary?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a21" as="xs:hexBinary?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a22" as="xs:float?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a24" as="xs:decimal?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a27" as="xs:double?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a30" as="xs:integer?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a32" as="xs:anyURI?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a34" as="xs:dayTimeDuration?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a36" as="xs:yearMonthDuration?">
	     <xslt:sequence select="()"/>
   </xslt:template>

   <xslt:template name="a38" as="xs:string?">
	     <xslt:sequence select="()"/>
   </xslt:template>
</xslt:transform>
