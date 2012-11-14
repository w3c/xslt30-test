<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with xsl:analyze-string using multiline mode (@flags is set to 'm').-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/doc">
      <t:text>
</t:text>
      <doc xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <out>
            <t:text>
</t:text>
            <E1>
               <t:analyze-string select="poem" regex="Kaum.*krahen">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
            </E1>
            <t:text>
</t:text>
            <E2>
               <t:analyze-string select="poem_multiline" regex="Kaum.*krahen">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
            </E2>
            <t:text>
</t:text>
            <E3>
               <t:analyze-string select="poem_multiline" regex="Kaum.*krahen" flags="m">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
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
               <t:analyze-string select="poem" regex="^Kaum.*gesehen,$">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
            </E4>
            <t:text>
</t:text>
            <E5>
               <t:analyze-string select="poem_multiline" regex="^Kaum.*gesehen,$">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
            </E5>
            <t:text>
</t:text>
            <E6>
               <t:analyze-string select="poem_multiline" regex="^Kaum.*gesehen,$" flags="m">
    	             <t:matching-substring>
    		               <t:value-of select="'*'"/>
    	             </t:matching-substring>
    	             <t:non-matching-substring>
    		               <t:value-of select="."/>
    	             </t:non-matching-substring>
    	          </t:analyze-string>
            </E6>
            <t:text>
</t:text>
         </out>
      </doc>
   </t:template>
</t:transform>
