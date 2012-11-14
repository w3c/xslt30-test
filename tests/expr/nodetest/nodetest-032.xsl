<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://www.schemanodetest.example.com/ns/various"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             version="2.0">
<!-- Purpose: Test schema-attribute($name) with an axis. Axes tested-->

   <t:import-schema namespace="http://www.schemanodetest.example.com/ns/various"
                    schema-location="variousTypesNodeTest.xsd"/>

   <t:template match="/my:userNode">
	     <out>
         <t:text>
</t:text>
         <E1>
            <t:value-of select="ancestor::schema-attribute(my:count)"/>
         </E1>
         <t:text>
</t:text>
         <E2>
            <t:value-of select="ancestor-or-self::schema-attribute(my:colors)"/>
         </E2>
         <t:text>
</t:text>
         <E3>
            <t:value-of select="attribute::schema-attribute(my:listParts)"/>
         </E3>
         <t:text>
</t:text>
         <E4>
            <t:value-of select="self::schema-attribute(my:specialPart)"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:value-of select="child::schema-attribute(my:listParts)"/>
         </E5>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
