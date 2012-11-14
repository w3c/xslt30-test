<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0">


<!--            Test 'ne' on two attributes of two different types derived from xs:NOTATION with 
  				at least one matching enumeration value. The schema is not imported and has no 
  				@targetNamespace.Check that the attributes are of type xs:NOTATION. Cases tested:
				-attributes have the same enumeration value, returns false
				-attributes have different enumeration values, returns true-->

   <xslt:import-schema schema-location="noNamespaceNotation.xsd"/>

   <xslt:template match="/doc">
      <xslt:call-template name="nl"/>
      <out>
         <xslt:call-template name="nl"/>
         <types>
            <xslt:for-each select="sub">
			            <xslt:value-of select="./@name"/>
			            <xslt:text> * </xslt:text>
			            <xslt:value-of select="data(./@filetype) instance of xs:NOTATION"/>
			            <xslt:value-of select="data(./@notetype) instance of xs:NOTATION"/>
			            <xslt:call-template name="nl"/>
		          </xslt:for-each>
         </types>
         <xslt:call-template name="nl"/>
         <case1>
            <xslt:value-of select="sub[@name='a']/@filetype eq sub[@name='a']/@notetype"/>
         </case1>
         <xslt:call-template name="nl"/>
         <case2>
            <xslt:value-of select="sub[@name='b']/@filetype eq sub[@name='b']/@notetype"/>
         </case2>
         <xslt:call-template name="nl"/>
      </out>
   </xslt:template>
   
   <xslt:template name="nl">
     <xslt:text>&#10;</xslt:text>
   </xslt:template>
</xslt:transform>
