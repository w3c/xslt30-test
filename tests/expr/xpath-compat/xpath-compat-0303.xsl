<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test string-join() second argument choosing first of multiple nodes and being cast to string. -->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="/" version="1.0">
      <out>
         <t:text>
</t:text>
         <first>
            <t:value-of select="string-join(doc/a,'-')"/>
         </first>
         <t:text>
</t:text>
         <second>
            <t:value-of select="string-join(doc/a,doc/b)"/>
         </second>
         <t:text>
</t:text>
         <third>
            <t:value-of select="string-join(doc/a,4+4)"/>
         </third>
         <t:text>
</t:text>
         <third>
            <t:value-of select="string-join(doc/b,true())"/>
         </third>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
