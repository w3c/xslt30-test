<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with replace($input?,$pattern,$replacement) on a literal string or empty 
  				sequence where pattern uses positional metacharacters ^ and $. 
				Included border cases:  - $input is an empty string
										- $input is an empty sequence
										- $pattern does not find a match -->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/">
      <out>
         <t:text>
</t:text>
         <E1>
            <t:value-of select="replace('abracadabra','bra', '*')"/>
         </E1>
         <t:text>
</t:text>
         <E2>
            <t:value-of select="replace('abracadabra','^a.*a$', '*')"/>
         </E2>
         <t:text>
</t:text>
         <E3>
            <t:value-of select="replace('abracadabra','^.+$', '*')"/>
         </E3>
         <t:text>
</t:text>
         <E4>
            <t:value-of select="replace('abracadabra','^.+.*.*$', '*')"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:value-of select="replace('','^ $', '*')"/>
         </E5>
         <t:text>
</t:text>
         <E6>
            <t:value-of select="replace((),'^ $', '*')"/>
         </E6>
         <t:text>
</t:text>
         <E7>
            <t:value-of select="replace('abracadabra','^a(.)','*$1$1')"/>
         </E7>
         <t:text>
</t:text>
         <E8>
            <t:value-of select="replace('abracadabra','^A.*A$', '*')"/>
         </E8>
         <t:text>
</t:text>
         <E9>
            <t:value-of select="replace('abracadabra','^bra', '*')"/>
         </E9>
         <t:text>
</t:text>
         <E10>
            <t:value-of select="replace('abracadabra','abr$', '*')"/>
         </E10>
         <t:text>
</t:text>
         <E11>
            <t:value-of select="replace('abracadabra','^.$', '*')"/>
         </E11>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
