<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with replace($input?,$pattern,$replacement,$flags) using multiline mode ($flags is set to 'm'). -->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/doc">
      <output xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:text>
</t:text>
         <out>
            <t:text>
</t:text>
            <E1>
               <t:value-of select="replace(poem,'Kaum.*krahen', '*')"/>
            </E1>
            <t:text>
</t:text>
            <E2>
               <t:value-of select="replace(poem_multiline,'Kaum.*krahen', '*')"/>
            </E2>
            <t:text>
</t:text>
            <E3>
               <t:value-of select="replace(poem_multiline,'Kaum.*krahen', '*', 'm')"/>
            </E3>
            <t:text>
</t:text>
         </out>
         <t:text>
</t:text>
         <out>
            <t:text>
</t:text>
            <E4>
               <t:value-of select="replace(poem,'^Kaum.*gesehen,$', '*')"/>
            </E4>
            <t:text>
</t:text>
            <E5>
               <t:value-of select="replace(poem_multiline,'^Kaum.*gesehen,$', '*')"/>
            </E5>
            <t:text>
</t:text>
            <E6>
               <t:value-of select="replace(poem_multiline,'^Kaum.*gesehen,$', '*','m')"/>
            </E6>
            <t:text>
</t:text>
         </out>
      </output>
   </t:template>
</t:transform>
