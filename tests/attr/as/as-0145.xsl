<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.example.com/ns/various"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test of xsl:template with a sequence constructor of LREs and @as= built-in derived atomic type. 
  				Value of LRE is in the lexical space of the type in @as.-->

   <xslt:template match="/doc">
      <out>
         <xslt:text>
</xslt:text>
         <temp1>
            <xslt:call-template name="temp1"/>
         </temp1>
         <xslt:text>
</xslt:text>
         <temp2>
            <xslt:call-template name="temp2"/>
         </temp2>
         <xslt:text>
</xslt:text>
         <temp3>
            <xslt:call-template name="temp3"/>
         </temp3>
         <xslt:text>
</xslt:text>
         <temp4>
            <xslt:call-template name="temp4"/>
         </temp4>
         <xslt:text>
</xslt:text>
         <temp5>
            <xslt:call-template name="temp5"/>
         </temp5>
         <xslt:text>
</xslt:text>
         <temp6>
            <xslt:call-template name="temp6"/>
         </temp6>
         <xslt:text>
</xslt:text>
         <temp7>
            <xslt:call-template name="temp7"/>
         </temp7>
         <xslt:text>
</xslt:text>
         <temp8>
            <xslt:call-template name="temp8"/>
         </temp8>
         <xslt:text>
</xslt:text>
         <temp9>
            <xslt:call-template name="temp9"/>
         </temp9>
         <xslt:text>
</xslt:text>
         <temp10>
            <xslt:call-template name="temp10"/>
         </temp10>
         <xslt:text>
</xslt:text>
         <temp11>
            <xslt:call-template name="temp11"/>
         </temp11>
         <xslt:text>
</xslt:text>
         <temp12>
            <xslt:call-template name="temp12"/>
         </temp12>
         <xslt:text>
</xslt:text>
         <temp13>
            <xslt:call-template name="temp13"/>
         </temp13>
         <xslt:text>
</xslt:text>
         <temp14>
            <xslt:call-template name="temp14"/>
         </temp14>
         <xslt:text>
</xslt:text>
         <temp15>
            <xslt:call-template name="temp15"/>
         </temp15>
         <xslt:text>
</xslt:text>
         <temp16>
            <xslt:call-template name="temp16"/>
         </temp16>
         <xslt:text>
</xslt:text>
         <temp17>
            <xslt:call-template name="temp17"/>
         </temp17>
         <xslt:text>
</xslt:text>
         <temp18>
            <xslt:call-template name="temp18"/>
         </temp18>
         <xslt:text>
</xslt:text>
         <temp19>
            <xslt:call-template name="temp19"/>
         </temp19>
         <xslt:text>
</xslt:text>
         <temp20>
            <xslt:call-template name="temp20"/>
         </temp20>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>

   <xslt:template name="temp1" as="xs:normalizedString">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">like</item>
   </xslt:template>

   <xslt:template name="temp2" as="xs:token">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">two organizations</item>
   </xslt:template>

   <xslt:template name="temp3" as="xs:language">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">PT</item>
   </xslt:template>

   <xslt:template name="temp4" as="xs:Name">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">a:_underscore_</item>
   </xslt:template>

   <xslt:template name="temp5" as="xs:NCName">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">vwxyz12</item>
   </xslt:template>

   <xslt:template name="temp6" as="xs:NMTOKEN">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">business-enforcement::link-chain.common</item>
   </xslt:template>

   <xslt:template name="temp7" as="xs:int">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">131072</item>
   </xslt:template>

   <xslt:template name="temp8" as="xs:nonPositiveInteger">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-7632460</item>
   </xslt:template>

   <xslt:template name="temp9" as="xs:positiveInteger">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">18446744</item>
   </xslt:template>

   <xslt:template name="temp10" as="xs:nonNegativeInteger">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">4444</item>
   </xslt:template>

   <xslt:template name="temp11" as="xs:negativeInteger">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-74146</item>
   </xslt:template>

   <xslt:template name="temp12" as="xs:long">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-9223372</item>
   </xslt:template>

   <xslt:template name="temp13" as="xs:unsignedLong">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">1844674</item>
   </xslt:template>

   <xslt:template name="temp14" as="xs:unsignedInt">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">573231403</item>
   </xslt:template>

   <xslt:template name="temp15" as="xs:short">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-32768</item>
   </xslt:template>

   <xslt:template name="temp16" as="xs:unsignedShort">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">65535</item>
   </xslt:template>

   <xslt:template name="temp17" as="xs:byte">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">-128</item>
   </xslt:template>

   <xslt:template name="temp18" as="xs:unsignedByte">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">110</item>
   </xslt:template>

   <xslt:template name="temp19" as="xs:ID">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">_a</item>
   </xslt:template>

   <xslt:template name="temp20" as="xs:IDREF">
	     <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">_a</item>
   </xslt:template>
</xslt:transform>
