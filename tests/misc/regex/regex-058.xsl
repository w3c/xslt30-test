<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with replace($input?,$pattern,$replacement) on a literal string or empty sequence 
  				where pattern uses reluctant quantifiers. Included border cases:
				- $input is an empty string
				- $input is an empty sequence
				- $pattern does not find a match-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/">
      <t:text>
</t:text>
      <out>
         <t:text>
</t:text>
         <e1>
            <t:value-of select="replace('aaaa','a+', 'b')"/>
         </e1>
         <t:text>
</t:text>
         <E1>
            <t:value-of select="replace('aaaa','a+?', 'b')"/>
         </E1>
         <t:text>
</t:text>
         <E2>
            <t:value-of select="replace('aaaaaa','a{2}?', 'b')"/>
         </E2>
         <t:text>
</t:text>
         <e3>
            <t:value-of select="replace('aaaaaa','a{2,}', 'b')"/>
         </e3>
         <t:text>
</t:text>
         <E3>
            <t:value-of select="replace('aaaaaa','a{2,}?', 'b')"/>
         </E3>
         <t:text>
</t:text>
         <e4>
            <t:value-of select="replace('aaaaaa','a{2,3}', 'b')"/>
         </e4>
         <t:text>
</t:text>
         <E4>
            <t:value-of select="replace('aaaaaa','a{2,3}?', 'b')"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:value-of select="replace('a','a{2,3}?', 'b')"/>
         </E5>
         <t:text>
</t:text>
         <E6>
            <t:value-of select="replace('','.+?', 'b')"/>
         </E6>
         <t:text>
</t:text>
         <E7>
            <t:value-of select="replace((),'.+?', 'b')"/>
         </E7>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
