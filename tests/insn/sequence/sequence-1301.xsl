<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: sequence constructor/concatenator with nodes -->

   <t:template match="/">
      <t:text>
</t:text>
      <out>
         <t:text>
</t:text>
         <t:value-of select="(//what,/doc/a)" separator=", "/>
         <t:text>
</t:text>
         <t:value-of select="(//*/@attr,/doc/c/noodle,/doc/b)" separator=", "/>
         <t:text>
</t:text>
      </out>
      <t:text>
</t:text>
   </t:template>
</t:transform>
