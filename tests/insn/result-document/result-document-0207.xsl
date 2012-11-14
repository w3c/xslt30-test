<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test with xsl:result-document that creates a non-well-formed XML document 
  				entity (contains more than one document element).-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:template match="/">
      <t:result-document>
         <t:text>
</t:text>
         <out>hello1</out>
         <t:text>
</t:text>
         <out>hello2</out>
         <t:text>
</t:text>
         <out>hello3</out>
         <t:text>
</t:text>
         <out>hello4</out>
      </t:result-document>
   </t:template>
</t:transform>
