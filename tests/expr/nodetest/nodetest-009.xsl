<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://www.schemanodetest.example.com/ns/various"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             input-type-annotations="strip"
             version="2.0">
<!-- Purpose: Show that stylesheet attribute @input-type-annotation="strip" makes the schema-element test fail. -->

   <t:import-schema namespace="http://www.schemanodetest.example.com/ns/various"
                    schema-location="variousTypesNodeTest.xsd"/>

   <t:template match="/my:userNode">
	     <out>
         <t:text>
</t:text>
         <E1>
            <t:value-of select="schema-element(my:simpleBuiltin)"/>
         </E1>
         <t:text>
</t:text>
         <E2>
            <t:value-of select="schema-element(my:simpleUserElem)"/>
         </E2>
         <t:text>
</t:text>
         <E3>
            <t:value-of select="schema-element(my:simpleUserList)"/>
         </E3>
         <t:text>
</t:text>
         <E4>
            <t:value-of select="schema-element(my:simpleUserUnion)"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:copy-of select="schema-element(my:complexUserElem)"/>
         </E5>
         <t:text>
</t:text>
         <E6>
            <t:copy-of select="schema-element(my:complexMixedUserElem)"/>
         </E6>
         <t:text>
</t:text>
         <E7>
            <t:value-of select="schema-element(my:complexSimpleContentElem)"/>
         </E7>
         <t:text>
</t:text>
         <E8>
            <t:value-of select="schema-element(my:onlyAttributes)"/>
         </E8>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
