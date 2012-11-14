<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with xsl:analyze-string to test context item, position and size inside xsl:(non)-matching-substring.-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/doc">
      <t:text>
</t:text>
      <out>
         <t:text>
</t:text>
         <E1>
            <t:analyze-string select="str[3]" regex="a">
    	          <t:matching-substring>
    		            <t:text>Matching-Item: </t:text>
                  <t:value-of select="current()"/>
    		            <t:text>
</t:text>
    		            <t:text>Position: </t:text>
                  <t:value-of select="position()"/>
    		            <t:text>
</t:text>
    		            <t:text>Size: </t:text>
                  <t:value-of select="last()"/>
    		            <t:text>
**
</t:text>
    	          </t:matching-substring>
    	          <t:non-matching-substring>
    		            <t:text>Non-matching-Item: </t:text>
                  <t:value-of select="current()"/>
    		            <t:text>
</t:text>
    		            <t:text>Position: </t:text>
                  <t:value-of select="position()"/>
    		            <t:text>
</t:text>
    		            <t:text>Size: </t:text>
                  <t:value-of select="last()"/>
    		            <t:text>
**
</t:text>
    	          </t:non-matching-substring>
            </t:analyze-string>
         </E1>
      </out>
   </t:template>
</t:transform>
