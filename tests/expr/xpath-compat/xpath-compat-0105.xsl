<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: General compare of boolean constant to zero-length string. -->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="/" version="1.0">
      <out>
         <t:text>
</t:text>
         <eqTrue>
            <t:value-of select="''=true()"/>
         </eqTrue>
         <t:text>
</t:text>
         <eqFalse>
            <t:value-of select="false()=''"/>
         </eqFalse>
         <t:text>
</t:text>
         <neTrue>
            <t:value-of select="'' != true()"/>
         </neTrue>
         <t:text>
</t:text>
         <neFalse>
            <t:value-of select="false() != ''"/>
         </neFalse>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
