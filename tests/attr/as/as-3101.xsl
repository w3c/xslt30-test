<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ul="http://www.example.com/ns/union-list"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs ul"
                version="2.0">

<!--            Test type of global xsl:variable without @select and 
  				@as="element(QName, user-defined-union-type)". Sequence 
  				constructor contains a typed element from input file, or 
  				explicitly created xsl:element or LRE. Item types in the 
  				union are: -built-in primitive, built-in derived, user-defined 
  				atomic, list, mix of the above-->

   <xslt:import-schema namespace="http://www.example.com/ns/union-list"
                       schema-location="list-unionSchemaAs.xsd"/>

   <xslt:variable name="v1" as="element(ul:union-primitive, ul:primitiveUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:union-primitive[1]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v2" as="element(ul:union-primitive, ul:primitiveUnionType)">
	     <ul:union-primitive xslt:type="ul:primitiveUnionType">two words</ul:union-primitive>
   </xslt:variable>

   <xslt:variable name="v3" as="element(ul:union-derived, ul:derivedUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:union-derived[2]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v4" as="element(ul:union-derived, ul:derivedUnionType)">
	     <ul:union-derived xslt:type="ul:derivedUnionType">-128</ul:union-derived>
   </xslt:variable>

   <xslt:variable name="v5"
                  as="element(ul:union-user-defined, ul:user-definedUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:union-user-defined[1]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v6"
                  as="element(ul:union-user-defined, ul:user-definedUnionType)">
	     <ul:union-user-defined xslt:type="ul:user-definedUnionType">000-AB</ul:union-user-defined>
   </xslt:variable>

   <xslt:variable name="v7" as="element(ul:union-list, ul:listUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:union-list[3]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v8" as="element(ul:union-list, ul:listUnionType)">
	     <ul:union-list xslt:type="ul:listUnionType">123-CD 456-EF</ul:union-list>
   </xslt:variable>

   <xslt:variable name="v9"
                  as="element(ul:part-integer-union, ul:partIntegerUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:part-integer-union[1]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v10"
                  as="element(ul:part-integer-union, ul:partIntegerUnionType)">
	     <ul:part-integer-union xslt:type="ul:partIntegerUnionType">4</ul:part-integer-union>
   </xslt:variable>

   <xslt:variable name="v11" as="element(ul:union-complex, ul:complexUnionType)">
	     <xslt:copy-of select="/ul:userNode/ul:union-complex[1]" validation="strict"/>
   </xslt:variable>

   <xslt:variable name="v12" as="element(ul:union-complex, ul:complexUnionType)">
	     <ul:union-complex xslt:type="ul:complexUnionType">127</ul:union-complex>
   </xslt:variable>

   <xslt:template match="/">
      <out>
         <xslt:text>
</xslt:text>
         <var1>
            <xslt:value-of select="$v1 instance of element(ul:union-primitive, ul:primitiveUnionType)"/>
         </var1>
         <xslt:text>
</xslt:text>
         <var2>
            <xslt:value-of select="$v2 instance of element(ul:union-primitive, ul:primitiveUnionType)"/>
         </var2>
         <xslt:text>
</xslt:text>
         <var3>
            <xslt:value-of select="$v3 instance of element(ul:union-derived, ul:derivedUnionType)"/>
         </var3>
         <xslt:text>
</xslt:text>
         <var4>
            <xslt:value-of select="$v4 instance of element(ul:union-derived, ul:derivedUnionType)"/>
         </var4>
         <xslt:text>
</xslt:text>
         <var5>
            <xslt:value-of select="$v5 instance of element(ul:union-user-defined, ul:user-definedUnionType)"/>
         </var5>
         <xslt:text>
</xslt:text>
         <var6>
            <xslt:value-of select="$v6 instance of element(ul:union-user-defined, ul:user-definedUnionType)"/>
         </var6>
         <xslt:text>
</xslt:text>
         <var7>
            <xslt:value-of select="$v7 instance of element(ul:union-list, ul:listUnionType)"/>
         </var7>
         <xslt:text>
</xslt:text>
         <var8>
            <xslt:value-of select="$v8 instance of element(ul:union-list, ul:listUnionType)"/>
         </var8>
         <xslt:text>
</xslt:text>
         <var9>
            <xslt:value-of select="$v9 instance of element(ul:part-integer-union, ul:partIntegerUnionType)"/>
         </var9>
         <xslt:text>
</xslt:text>
         <var10>
            <xslt:value-of select="$v10 instance of element(ul:part-integer-union, ul:partIntegerUnionType)"/>
         </var10>
         <xslt:text>
</xslt:text>
         <var11>
            <xslt:value-of select="$v11 instance of element(ul:union-complex, ul:complexUnionType)"/>
         </var11>
         <xslt:text>
</xslt:text>
         <var12>
            <xslt:value-of select="$v12 instance of element(ul:union-complex, ul:complexUnionType)"/>
         </var12>
      </out>
   </xslt:template>
</xslt:transform>
