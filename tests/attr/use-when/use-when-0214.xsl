<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test case in which use-when is used with element-available and function-available functions
  				Where the element and function do NOT exist.  -->

   <t:template match="/">
		    <out>
         <t:text>
</t:text>
         <t:element name="E1" use-when="element-available('t:values-of')">
	           <t:text>Element defined</t:text>
	        </t:element>
         <t:text>
</t:text>
         <E2>function-available('documents')<t:text>function IS defined</t:text>
         </E2>
         <t:text>
</t:text>
      </out>
	  </t:template>
</t:transform>
