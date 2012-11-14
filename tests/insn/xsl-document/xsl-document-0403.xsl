<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test case that uses xsl:document inside a literal result element. -->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="doc">
		    <out>
         <t:document>
  				      <child>1child element</child>
  			    </t:document>
      </out>
	  </t:template>
</t:transform>
