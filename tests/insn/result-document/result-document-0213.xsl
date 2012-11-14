<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test with xsl:result-document @method="xml".-->

   <t:template match="/">
      <t:result-document method="xml">
         <t:text>
</t:text>
         <html xmlns="http://www.mytest.example.org"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <out>hello</out>
         </html>
      </t:result-document>
   </t:template>
</t:transform>
