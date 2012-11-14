<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://www.example.com/ns/various"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs my"
                version="2.0">
<!-- Purpose: Test type of xsl:functions that returns user-defined types derived by restriction 
  				from xs:decimal or from xs:float, @as="xs:double".(type promotion)-->

   <xslt:import-schema namespace="http://www.example.com/ns/various"
                       schema-location="variousTypesSchemaAs.xsd"/>

   <xslt:function name="my:func1" as="xs:double">
	     <xslt:value-of select="document('schemaas20_003.xml')/my:userNode/my:de1-decimal-enumeration-inline"/>
   </xslt:function>

   <xslt:function name="my:func2" as="xs:double">
	     <xslt:value-of select="document('schemaas20_003.xml')/my:userNode/my:derived-float"/>
   </xslt:function>

   <xslt:template match="/">
      <out>
         <xslt:text>
</xslt:text>
         <func1>
            <xslt:value-of select="my:func1() instance of my:de1-decimal-enumeration-Inline"/>
            <xslt:value-of select="my:func1() instance of xs:double"/>
         </func1>
         <xslt:text>
</xslt:text>
         <func2>
            <xslt:value-of select="my:func2() instance of my:derived-float-Type"/>
            <xslt:value-of select="my:func2() instance of xs:double"/>
         </func2>
      </out>
   </xslt:template>
</xslt:transform>
