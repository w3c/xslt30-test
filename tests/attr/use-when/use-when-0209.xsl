<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test case that uses use-when on an LRE in different levels (Parent-child, grandchild) 
  				(The EBV of the attribute results to true).  -->

   <t:template match="doc">
  	   <out>
         <t:text>
</t:text>
         <e>
            <t:text>
</t:text>
            <e1>1=1<t:text>
</t:text>
               <e1.1>true()v1.1</e1.1>
               <t:text>
</t:text>
               <e1.2>1=1v1.2
				<e1.2.1>v1.2.1</e1.2.1>&gt;
				<t:text>
</t:text>
               </e1.2>
               <t:text>
</t:text>
            </e1>
            <t:text>
</t:text>
         </e>
      </out>
  </t:template>
</t:transform>
