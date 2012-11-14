<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with xsl:analyze-string using case-sensitive mode (@flags is set to 'i').-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="doc">
      <t:text>
</t:text>
      <out>
         <t:apply-templates select="*"/>
      </out>
   </t:template>

   <t:template match="str1|str2">
      <t:text>
</t:text>
      <t:text>Analyzing from </t:text>
      <t:value-of select="."/>
      <t:text>
</t:text>
      <e1 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="GHIJ">
  		        <t:matching-substring>
    		         <t:value-of select="'!!!!'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
    	    </t:analyze-string>
      </e1>
      <t:text>
</t:text>
      <E1 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="GHIJ" flags="i">
  		        <t:matching-substring>
    		         <t:value-of select="'!!!!'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
    	    </t:analyze-string>
      </E1>
      <t:text>
</t:text>
      <e2 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="efGhijk">
  		        <t:matching-substring>
    		         <t:value-of select="'1234567'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
    	    </t:analyze-string>
      </e2>
      <t:text>
</t:text>
      <E2 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="efGhijk" flags="i">
  		        <t:matching-substring>
    		         <t:value-of select="'1234567'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
    	    </t:analyze-string>
      </E2>
      <t:text>
</t:text>
      <e3 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="e([a-z]*)H([A-Z]*)k">
  		        <t:matching-substring>
    		         <t:value-of select="'#'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
         </t:analyze-string>
      </e3>
      <t:text>
</t:text>
      <E3 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:analyze-string select="." regex="e([a-z]*)H([A-Z]*)k" flags="i">
  		        <t:matching-substring>
    		         <t:value-of select="'#'"/>
    	       </t:matching-substring>
    	       <t:non-matching-substring>
    		         <t:value-of select="."/>
    	       </t:non-matching-substring>
         </t:analyze-string>
      </E3>
      <t:text>
</t:text>
   </t:template>
</t:transform>
