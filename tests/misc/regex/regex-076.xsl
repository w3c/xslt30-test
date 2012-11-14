<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Use regex-group() inside @group-starting-with of xsl:for-each-group.Verify that the set of captured substrings is set to an empty sequence inside a pattern. -->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="doc">
      <out>
         <t:analyze-string select="str1" regex="(a)B(c)D(e)F(g)">
            <t:matching-substring>
               <t:text>
</t:text>
      	        <empty>
                  <t:text>Testing with an empty captured substring
</t:text>
                  <t:for-each-group select="doc('regex20_030.xml')//item"
                                    group-starting-with="//item[@attr=string(regex-group(6))]">
                     <t:value-of select="."/>
                  </t:for-each-group>
               </empty>
               <t:text>
</t:text>
               <empty>
                  <t:text>Testing with regex-group(1)
</t:text>
                  <t:for-each-group select="doc('regex20_030.xml')//item"
                                    group-starting-with="//item[@attr=string(regex-group(1))]">
                     <t:value-of select="."/>
                  </t:for-each-group>
               </empty>
               <t:text>
</t:text>
            </t:matching-substring>
            <t:non-matching-substring>
               <empty>
                  <t:value-of select="."/>
               </empty>
            </t:non-matching-substring>
         </t:analyze-string>
      </out>
   </t:template>
</t:transform>
