<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with replace($input?,$pattern,$replacement) on a literal string or empty sequence where pattern uses backreferences. Verifies that backreferences 
				  match the exact string that was already matched by the capturing subexpressions they refer to and not just its pattern.-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/">
      <t:text>
</t:text>
      <out>
         <t:text>
</t:text>
         <E1>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(da)( )(kommen)\2(sie)', '*')"/>
         </E1>
         <t:text>
</t:text>
         <E2>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(ki){2}ke.*\1', '*')"/>
         </E2>
         <t:text>
</t:text>
         <E3>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(ki|ke)\1', '*')"/>
         </E3>
         <t:text>
</t:text>
         <E4>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(!).*\1', '*')"/>
         </E4>
         <t:text>
</t:text>
         <E5>
            <t:value-of select="replace('kikikeriki2!! Tak, tak, tak! - da kommen sie.','(ki){2}ke.*\12', '*')"/>
         </E5>
         <t:text>
</t:text>
         <E6>
            <t:value-of select="replace('','(.)\1', '*')"/>
         </E6>
         <t:text>
</t:text>
         <E7>
            <t:value-of select="replace((),'(.)\1', '*')"/>
         </E7>
         <t:text>
</t:text>
         <E8>
            <t:value-of select="replace('123kikikeriki123','([0-9]+)([a-z]+)\1', '*')"/>
         </E8>
         <t:text>
</t:text>
         <E9>
            <t:value-of select="replace('123kikikeriki4566','(1)(2)(3)(ki)(k)(i)(ke)(ri)(ki)(4)(5)(6)\12', '*')"/>
         </E9>
         <t:text>
</t:text>
         <E10>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(da)( )(kommen)\2(die)', '*')"/>
         </E10>
         <t:text>
</t:text>
         <E11>
            <t:value-of select="replace('kikikeriki!! Tak, tak, tak! - da kommen sie.','(ki){2}ke.*\12', '*')"/>
         </E11>
         <t:text>
</t:text>
         <E12>
            <t:value-of select="replace('123kikikeriki456','([0-9]+)([a-z]+)\1', '*')"/>
         </E12>
         <t:text>
</t:text>
         <E13>
            <t:value-of select="replace(' ','( )\1', '*')"/>
         </E13>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
