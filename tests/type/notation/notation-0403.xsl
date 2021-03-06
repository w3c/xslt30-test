<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:one="http://notation.example.com"
   xmlns:first="http://notation.example.com" xmlns:two="http://different.notation.example.com"
   xmlns:xslt="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs one first two"
   version="2.0">
   <!-- Purpose: Test 'eq' on two variables of the same type derived from xs:NOTATION. Type is set by @as, 
  				the schema is imported and has a @targetNamespace. Check that the variables are both of 
  				the derived type and of xs:NOTATION. Cases tested:
				-the variables have the same enumeration value, returns true
				-the variables have enumeration values with different prefix but same namespace binding and same local name, returns true
				-the variables have enumeration values with different prefix and matching local name, returns false
				-the variables have enumeration values with matching prefix but different local name, returns false-->

   <xslt:import-schema namespace="http://notation.example.com"
      schema-location="namespaceNotationTest.xsd"/>

   <xslt:variable name="mp3a" as="one:not1-NOTATION-enumeration-Type">
      <xslt:sequence select="one:not1-NOTATION-derived-Type('one:mp3')"/>
   </xslt:variable>

   <xslt:variable name="mp3b" as="one:not1-NOTATION-enumeration-Type">
      <xslt:sequence select="one:not1-NOTATION-derived-Type('one:mp3')"/>
   </xslt:variable>

   <xslt:variable name="mp3c" as="one:not1-NOTATION-enumeration-Type">
      <xslt:sequence select="one:not1-NOTATION-derived-Type('first:mp3')"/>
   </xslt:variable>

   <xslt:variable name="mp3d" as="one:not1-NOTATION-enumeration-Type">
      <xslt:sequence select="one:not1-NOTATION-derived-Type('two:mp3')"/>
   </xslt:variable>

   <xslt:variable name="wav" as="one:not1-NOTATION-enumeration-Type">
      <xslt:sequence select="one:not1-NOTATION-derived-Type('one:wav')"/>
   </xslt:variable>

   <xslt:template match="/">
      <out>
         <types>
            <xslt:for-each select="($mp3a, $mp3b, $mp3c, $mp3d, $wav)">
               <type val="{.}" p="{position()}"
                  is1="{. instance of one:not1-NOTATION-enumeration-Type}" 
                  is2="{. instance of xs:NOTATION}"/>
            </xslt:for-each>
         </types>
         <case1>
            <xslt:value-of select="$mp3a eq $mp3b"/>
         </case1>
         <case2>
            <xslt:value-of select="$mp3a eq $mp3c"/>
         </case2>
         <case3>
            <xslt:value-of select="$mp3a eq $mp3d"/>
         </case3>
         <case4>
            <xslt:value-of select="$mp3a eq $wav"/>
         </case4>
      </out>
   </xslt:template>
</xslt:transform>
