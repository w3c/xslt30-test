<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test with CDATA section element inside an LRE in the body of 
  				xsl:result-document and it has not been specified in the 
  				cdata-section-elements attribute.-->

   <t:template match="/">
      <t:result-document>
  		     <out>
            <t:text>
</t:text>
            <a>&lt;&lt;&lt;&gt;&gt;&gt;</a>
            <t:text>
</t:text>
            <b>&lt;&lt;&lt;&gt;&gt;&gt;</b>
            <t:text>
</t:text>
            <c>
               <t:sequence select="codepoints-to-string((60,60,60,62,62,62))"/>
            </c>
            <t:text>
</t:text>
         </out>
      </t:result-document>

   </t:template>
</t:transform>
