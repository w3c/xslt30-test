<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test case that uses <xsl:sequence> inside <xsl:element> to create chilrern and attributes for the element. -->

   <t:template match="/">
		    <out>
         <t:text>
</t:text>
         <t:element name="Asset">
   	 		     <t:sequence select="//e1/@*"/> 
   	 		     <t:text>
</t:text>
   	 		     <t:element name="{doc/data/e2}">
   	 			       <t:sequence select="//e2"/> 
   	 		     </t:element>
   	 	   </t:element>
         <t:text>
</t:text>
      </out>
	  </t:template>
</t:transform>