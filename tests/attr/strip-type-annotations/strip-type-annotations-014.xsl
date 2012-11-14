<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://ns.example.com/strip-type"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                input-type-annotations="preserve"
                version="2.0">
<!-- Purpose: Test with xsl:stylesheet and @input-type-annotations="preserve". 
  				Show that all element and attribute nodes preserve their type annotations. 
  				All nodes are of user-defined schema types.-->

   <xslt:import-schema namespace="http://ns.example.com/strip-type"
                       schema-location="varietyOfTypes.xsd"/>

   <xslt:template match="/my:userNode">
      <xslt:text>
</xslt:text>
      <out>
         <xslt:text>
</xslt:text>
         <E1>
            <xslt:value-of select=". instance of element(*, my:userType)"/>
            <xslt:value-of select=". instance of element(*, xs:untyped)"/>
         </E1>
         <xslt:text>
</xslt:text>
         <E2>
            <xslt:value-of select="data(@specialPart) instance of my:partNumberType"/>
            <xslt:value-of select="@specialPart instance of attribute(*, my:partNumberType)"/>
            <xslt:value-of select="data(@specialPart) instance of xs:untypedAtomic"/>
            <xslt:value-of select="@specialPart instance of attribute(*, xs:untypedAtomic)"/>
         </E2>
         <xslt:text>
</xslt:text>
         <E3>
            <xslt:value-of select="@listParts instance of attribute(*, my:myListType)"/>
            <xslt:value-of select="data(@listParts) instance of xs:untypedAtomic"/>
            <xslt:value-of select="@listParts instance of attribute(*, xs:untypedAtomic)"/>
         </E3>
         <xslt:text>
</xslt:text>
         <E4>
            <xslt:value-of select="data(simpleUserElem) instance of my:partNumberType"/>
            <xslt:value-of select="simpleUserElem instance of element(*, my:partNumberType)"/>
            <xslt:value-of select="data(simpleUserElem) instance of xs:untypedAtomic"/>
            <xslt:value-of select="simpleUserElem instance of element(*, xs:untyped)"/>
         </E4>
         <xslt:text>
</xslt:text>
         <E5>
            <xslt:value-of select="simpleUserList instance of element(*, my:myListType)"/>
            <xslt:value-of select="data(simpleUserList) instance of xs:untypedAtomic"/>
            <xslt:value-of select="simpleUserList instance of element(*, xs:untyped)"/>
         </E5>
         <xslt:text>
</xslt:text>
         <E6>
            <xslt:value-of select="simpleUserUnion instance of element(*, my:partIntegerUnion)"/>
            <xslt:value-of select="data(simpleUserUnion) instance of xs:untypedAtomic"/>
            <xslt:value-of select="simpleUserUnion instance of element(*, xs:untyped)"/>
         </E6>
         <xslt:text>
</xslt:text>
         <E7>
            <xslt:value-of select="complexMixedUserElem instance of element(*, my:mixedPersonType)"/>
            <xslt:value-of select="complexMixedUserElem instance of element(*, xs:untyped)"/>
         </E7>
         <xslt:text>
</xslt:text>
         <E8>
            <xslt:value-of select="data(complexMixedUserElem/@age) instance of xs:integer"/>
            <xslt:value-of select="complexMixedUserElem/@age instance of attribute(*, xs:integer)"/>
            <xslt:value-of select="data(complexMixedUserElem/@age) instance of xs:untypedAtomic"/>
            <xslt:value-of select="complexMixedUserElem/@age instance of attribute(*, xs:untypedAtomic)"/>
         </E8>
         <xslt:text>
</xslt:text>
         <E9>
            <xslt:value-of select="complexMixedUserElem/description instance of element(*, my:DescriptionType)"/>
            <xslt:value-of select="data(complexMixedUserElem/description) instance of xs:untypedAtomic"/>
            <xslt:value-of select="complexMixedUserElem/description instance of element(*, xs:untyped)"/>
         </E9>
         <xslt:text>
</xslt:text>
         <E10>
            <xslt:value-of select="complexMixedUserElem/company instance of element(*, my:CompanyType)"/>
            <xslt:value-of select="data(complexMixedUserElem/company) instance of xs:untypedAtomic"/>
            <xslt:value-of select="complexMixedUserElem/company instance of element(*, xs:untyped)"/>
         </E10>
         <xslt:text>
</xslt:text>
         <E11>
            <xslt:value-of select="complexUserElem instance of element(*, my:personType)"/>
            <xslt:value-of select="complexUserElem instance of element(*, xs:untyped)"/>
         </E11>
         <xslt:text>
</xslt:text>
         <E12>
            <xslt:value-of select="onlyAttributes instance of element(*, my:onlyAttributesType)"/>
            <xslt:value-of select="onlyAttributes instance of element(*, xs:untyped)"/>
         </E12>
         <xslt:text>
</xslt:text>
         <E13>
            <xslt:value-of select="data(onlyAttributes/@specialPart) instance of my:partNumberType"/>
            <xslt:value-of select="onlyAttributes/@specialPart instance of attribute(*, my:partNumberType)"/>
            <xslt:value-of select="data(onlyAttributes/@specialPart) instance of xs:untypedAtomic"/>
            <xslt:value-of select="onlyAttributes/@specialPart instance of attribute(*, xs:untypedAtomic)"/>
         </E13>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>
</xslt:transform>
