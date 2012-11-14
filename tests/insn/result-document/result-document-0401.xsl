<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://www.mytest.example.org"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             version="2.0">
<!-- Purpose: Test AVT in @cdata-section-elements of xsl:result-document.-->

   <t:template match="/doc">
      <t:result-document method="xml" cdata-section-elements="{foo[1]} my:{elem} {item}">
         <t:text>
</t:text>
         <out>
            <item1>a &amp; b</item1>
            <t:text>
</t:text>
            <item2>a &amp; b</item2>
            <t:text>
</t:text>
            <item3>a &amp; b</item3>
            <t:text>
</t:text>
            <item3 xmlns="http://www.mytest.example.org">a &amp; b</item3>
            <t:text>
</t:text>
            <item4>a &amp; b</item4>
            <t:text>
</t:text>
            <item5 xmlns="http://www.mytest.example.org">a &amp; b</item5>
            <t:text>
</t:text>
         </out>
      </t:result-document>
   </t:template>
</t:transform>
