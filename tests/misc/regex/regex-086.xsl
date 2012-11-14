<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with matches($input?,$pattern) where $input comes from a variable, node, 
  				context node(.) and subsequence; pattern uses reluctant quantifiers.-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:variable name="var1" select="/doc/str1"/>

   <t:variable name="var2" select="'a'"/>

   <t:variable name="var3" select="''"/>

   <t:template match="/doc/str1">
      <output xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:text>
</t:text>
         <out>Node:
    <t:value-of select="matches(//str1,'a??')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(//str1,'a*?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(//str1,'a+?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(//str1,'a{2}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(//str1,'a{2,}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(//str1,'a{2,3}?')"/>
         </out>
         <t:text>
</t:text>
         <out>Context node:
    <t:value-of select="matches(.,'a??')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(.,'a*?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(.,'a+?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(.,'a{2}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(.,'a{2,}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(.,'a{2,3}?')"/>
         </out>
         <t:text>
</t:text>
         <out>Variable:
    <t:value-of select="matches($var1,'a??')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var1,'a*?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var1,'a+?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var1,'a{2}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var1,'a{2,}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var1,'a{2,3}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var2,'a{2,3}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches($var3,'a*?')"/>
         </out>
         <t:text>
</t:text>
         <out>Subsequence:
    <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a??')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a*?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a+?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a{2}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a{2,}?')"/>
            <t:text>, </t:text>
            <t:value-of select="matches(subsequence(('a','abraacadabra',''),2,1),'a{2,3}?')"/>
         </out>
         <t:text>
</t:text>
      </output>
   </t:template>
</t:transform>
