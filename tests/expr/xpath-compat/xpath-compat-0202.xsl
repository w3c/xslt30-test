<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test substring-before() first or second argument being number or boolean. -->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="/" version="1.0">
      <out>
         <t:text>
</t:text>
         <first>
            <t:value-of select="substring-before(123456789,5)"/>
         </first>
         <t:text>
</t:text>
         <second>
            <t:value-of select="substring-before(doc/a[@z=4],4)"/>
         </second>
         <t:text>
</t:text>
         <third>
            <t:value-of select="substring-before(89236347,doc/f)"/>
         </third>
         <t:text>
</t:text>
         <fourth>
            <t:value-of select="substring-before(true(),'u')"/>
         </fourth>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
