<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="3.0">
<!-- Purpose: Test case that uses attribute value template for 'terminate' attribute of 
  				an xsl:message instruction, the value of the AVT which is the value of a 
  				parameter evaluates to '0'. -->

   <t:template match="/">
      <out>
         <t:message select="$v" terminate="{$terminate}">
</t:message>
         <not-terminated/>
      </out>
  </t:template>

   <t:param name="terminate"> 0</t:param>

   <t:variable name="v">Terminate attribute has a value of: <t:value-of select="$terminate"/>
   </t:variable>
</t:transform>
