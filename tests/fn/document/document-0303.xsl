<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase with doc(()). Result is the empty sequence-->

   <t:template match="/">
      <out>
         <t:copy-of select="doc(())"/>
      </out>
      <out>
         <t:copy-of select="doc(//str1)"/>
      </out>
   </t:template>
</t:transform>
