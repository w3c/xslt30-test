<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://ns.example.com/strip-type"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                input-type-annotations="unspecified"
                version="2.0">
<!-- Purpose: Test with xsl:stylesheet and @input-type-annotations="unspecified". 
  				Show that type annotations for input data are preserved.-->

   <xslt:import-schema namespace="http://ns.example.com/strip-type"
                       schema-location="varietyOfTypes.xsd"/>

   <xslt:template match="/my:doc">
		    <xslt:text>
</xslt:text>
      <out>
         <xslt:text>
</xslt:text>
         <E1>
            <xslt:value-of select="data(elem-anyURI) instance of xs:anyURI"/>
         </E1>
         <xslt:text>
</xslt:text>
         <E2>
            <xslt:value-of select="data(elem-boolean) instance of xs:boolean"/>
         </E2>
         <xslt:text>
</xslt:text>
         <E3>
            <xslt:value-of select="data(elem-date) instance of xs:date"/>
         </E3>
         <xslt:text>
</xslt:text>
         <E4>
            <xslt:value-of select="data(elem-double) instance of xs:double"/>
         </E4>
         <xslt:text>
</xslt:text>
         <E5>
            <xslt:value-of select="data(elem-duration) instance of xs:duration"/>
         </E5>
         <xslt:text>
</xslt:text>
         <E6>
            <xslt:value-of select="data(elem-QName) instance of xs:QName"/>
         </E6>
         <xslt:text>
</xslt:text>
         <E7>
            <xslt:value-of select="data(elem-string) instance of xs:string"/>
         </E7>
         <xslt:text>
</xslt:text>
         <E8>
            <xslt:value-of select="data(elem-NCName) instance of xs:NCName"/>
         </E8>
         <xslt:text>
</xslt:text>
         <E9>
            <xslt:value-of select="data(elem-NMTOKEN) instance of xs:NMTOKEN"/>
         </E9>
         <xslt:text>
</xslt:text>
         <E10>
            <xslt:value-of select="data(elem-int) instance of xs:int"/>
         </E10>
         <xslt:text>
</xslt:text>
         <E11>
            <xslt:value-of select="data(elem-nonPositiveInteger) instance of xs:nonPositiveInteger"/>
         </E11>
         <xslt:text>
</xslt:text>
         <E12>
            <xslt:value-of select="data(elem-long) instance of xs:long"/>
         </E12>
         <xslt:text>
</xslt:text>
         <E13>
            <xslt:value-of select="data(elem-unsignedLong) instance of xs:unsignedLong"/>
         </E13>
         <xslt:text>
</xslt:text>
         <E14>
            <xslt:value-of select="data(simple-derived) instance of my:partNumberType"/>
         </E14>
         <xslt:text>
</xslt:text>
         <E15>
            <xslt:value-of select="complex-derived instance of element(*, my:personType)"/>
         </E15>
         <xslt:text>
</xslt:text>
         <E16>
            <xslt:value-of select="data(complex-derived/firstName) instance of xs:string"/>
         </E16>
         <xslt:text>
</xslt:text>
         <E17>
            <xslt:value-of select="data(complex-derived/familyName) instance of xs:string"/>
         </E17>
         <xslt:text>
</xslt:text>
         <E18>
            <xslt:value-of select="data(complex-derived/@age) instance of xs:integer"/>
         </E18>
         <xslt:text>
</xslt:text>
         <E19>
            <xslt:value-of select="complex-derived/@age instance of attribute(*, xs:integer)"/>
         </E19>
         <xslt:text>
</xslt:text>
         <E20>
            <xslt:value-of select="list-builtin instance of element(*, xs:NMTOKENS)"/>
         </E20>
         <xslt:text>
</xslt:text>
         <E21>
            <xslt:value-of select="list-derived instance of element(*, my:myListType)"/>
         </E21>
         <xslt:text>
</xslt:text>
         <E22>
            <xslt:value-of select="union-derived[1] instance of element(*, my:partIntegerUnion)"/>
         </E22>
         <xslt:text>
</xslt:text>
         <E23>
            <xslt:value-of select="union-derived[2] instance of element(*, my:partIntegerUnion)"/>
         </E23>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>
</xslt:transform>
