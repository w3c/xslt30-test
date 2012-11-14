<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test substring-before() first or second argument choosing first of multiple nodes. -->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="/" version="1.0">
      <out>
         <t:text>
</t:text>
         <first>
            <t:value-of select="substring-before(doc/a,'o')"/>
         </first>
         <t:text>
</t:text>
         <second>
            <t:value-of select="substring-before('Aprilfool',doc/c)"/>
         </second>
         <t:text>
</t:text>
         <third>
            <t:value-of select="substring-before(doc/a,doc/d)"/>
         </third>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
