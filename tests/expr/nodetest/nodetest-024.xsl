<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://www.schemanodetest.example.com/ns/various"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             version="2.0">
<!-- Purpose: Test with schema-attribute($name) where $name is a top level attribute declaration. The type 
  				of the candidate node and the declaration in the schema match. Types tested are:
				-simple built-in, simple derived, list built-in, list derived, union-->

   <t:import-schema namespace="http://www.schemanodetest.example.com/ns/various"
                    schema-location="variousTypesNodeTest.xsd"/>

   <t:template match="/my:userNode">
	     <out>
         <t:text>
</t:text>
         <t:apply-templates select="my:complexSimpleContentElem|my:onlyAttributes"/>
         <E4>
            <t:value-of select="schema-attribute(my:specialPart)"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:value-of select="schema-attribute(my:listParts)"/>
         </E5>
         <t:text>
</t:text>
      </out>
   </t:template>

   <t:template match="my:complexSimpleContentElem">
	     <E1 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:value-of select="schema-attribute(my:count)"/>
      </E1>
      <t:text>
</t:text>
   </t:template>

   <t:template match="my:onlyAttributes">
	     <E2 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:value-of select="schema-attribute(my:colors)"/>
      </E2>
      <t:text>
</t:text>
	     <E3 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:value-of select="schema-attribute(my:union)"/>
      </E3>
      <t:text>
</t:text>
   </t:template>
</t:transform>
