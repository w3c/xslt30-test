<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.schemafunc.example.com/ns/various"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test fn:resolve-uri with arguments coming from typed nodes in input source. Types tested:
   				- xs:string, xs:normalizedString, xs:token, xs:language, xs:Name, xs:NCName, xs:NMTOKEN
   				xs:ID, xs:IDREF
   				- user-defined types derived by restriction from xs:string and all builtin types derived from it-->

   <xslt:import-schema namespace="http://www.schemafunc.example.com/ns/various"
                       schema-location="variousTypesSchemaFunc.xsd"/>

   <xslt:template match="/my:userNode">
      <out>
         <xslt:text>
</xslt:text>
         <e1>
            <xslt:value-of select="data(elem-string) instance of xs:string"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-string, 'http://base.example.org/ns/')"/>
         </e1>
         <xslt:text>
</xslt:text>
         <e2>
            <xslt:value-of select="data(elem-normalizedString) instance of xs:normalizedString"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-normalizedString, 'http://base.example.org/ns/')"/>
         </e2>
         <xslt:text>
</xslt:text>
         <e3>
            <xslt:value-of select="data(elem-token) instance of xs:token"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-token, 'http://base.example.org/ns/')"/>
         </e3>
         <xslt:text>
</xslt:text>
         <e4>
            <xslt:value-of select="data(elem-language) instance of xs:language"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-language, 'http://base.example.org/ns/')"/>
         </e4>
         <xslt:text>
</xslt:text>
         <e5>
            <xslt:value-of select="data(elem-Name) instance of xs:Name"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-Name,'http://base.example.org/ns/')"/>
         </e5>
         <xslt:text>
</xslt:text>
         <e6>
            <xslt:value-of select="data(elem-NCName) instance of xs:NCName"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-NCName, 'http://base.example.org/ns/')"/>
         </e6>
         <xslt:text>
</xslt:text>
         <e7>
            <xslt:value-of select="data(elem-NMTOKEN) instance of xs:NMTOKEN"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-NMTOKEN, 'http://base.example.org/ns/')"/>
         </e7>
         <xslt:text>
</xslt:text>
         <e8>
            <xslt:value-of select="data(elem-ID-attr/@attr1) instance of xs:ID"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-ID-attr/@attr1, 'http://base.example.org/ns/')"/>
         </e8>
         <xslt:text>
</xslt:text>
         <e9>
            <xslt:value-of select="data(elem-IDREF-attr/@attr1) instance of xs:IDREF"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-IDREF-attr/@attr1, 'http://base.example.org/ns/')"/>
         </e9>
         <xslt:text>
</xslt:text>
         <e10>
            <xslt:value-of select="data(elem-string-derived) instance of xs:string"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-string-derived) instance of my:elem-string-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-string-derived, 'http://base.example.org/ns/')"/>
         </e10>
         <xslt:text>
</xslt:text>
         <e11>
            <xslt:value-of select="data(elem-normalizedString-derived) instance of xs:normalizedString"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-normalizedString-derived) instance of my:elem-normalizedString-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-normalizedString-derived, 'http://base.example.org/ns/')"/>
         </e11>
         <xslt:text>
</xslt:text>
         <e12>
            <xslt:value-of select="data(elem-token-derived) instance of xs:token"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-token-derived) instance of my:elem-token-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-token-derived, 'http://base.example.org/ns/')"/>
         </e12>
         <xslt:text>
</xslt:text>
         <e13>
            <xslt:value-of select="data(elem-language-derived) instance of xs:language"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-language-derived) instance of my:elem-language-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-language-derived, 'http://base.example.org/ns/')"/>
         </e13>
         <xslt:text>
</xslt:text>
         <e14>
            <xslt:value-of select="data(elem-Name-derived) instance of xs:Name"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-Name-derived) instance of my:elem-Name-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-Name-derived, 'http://base.example.org/ns/')"/>
         </e14>
         <xslt:text>
</xslt:text>
         <e15>
            <xslt:value-of select="data(elem-NCName-derived) instance of xs:NCName"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-NCName-derived) instance of my:elem-NCName-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-NCName-derived, 'http://base.example.org/ns/')"/>
         </e15>
         <xslt:text>
</xslt:text>
         <e16>
            <xslt:value-of select="data(elem-NMTOKEN-derived) instance of xs:NMTOKEN"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-NMTOKEN-derived) instance of my:elem-NMTOKEN-derived-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-NMTOKEN-derived, 'http://base.example.org/ns/')"/>
         </e16>
         <xslt:text>
</xslt:text>
         <e17>
            <xslt:value-of select="data(elem-ID-attr-derived/@attr1) instance of xs:ID"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-ID-attr-derived/@attr1) instance of my:id2-ID-length-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-ID-attr-derived/@attr1, 'http://base.example.org/ns/')"/>
         </e17>
         <xslt:text>
</xslt:text>
         <e18>
            <xslt:value-of select="data(elem-IDREF-attr-derived/@attr1) instance of xs:IDREF"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="data(elem-IDREF-attr-derived/@attr1) instance of my:ir1-IDREF-enumeration-Type"/>
            <xslt:text> , </xslt:text>
            <xslt:value-of select="resolve-uri(elem-IDREF-attr-derived/@attr1, 'http://base.example.org/ns/')"/>
         </e18>
      </out>
   </xslt:template>
</xslt:transform>
