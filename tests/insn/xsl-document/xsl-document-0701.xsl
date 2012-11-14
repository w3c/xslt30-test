<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Tests to sort values inside an xsl:document.  -->

   <t:variable name="v" as="document-node()">
		    <t:document>
			      <t:for-each select="doc/item">
				        <t:sort select="@target" lang="en"/>
				        <t:value-of select="@num"/>
            <t:text>:</t:text>
				        <t:value-of select="@target"/>
            <t:text> * </t:text>
			      </t:for-each>
		    </t:document>
	  </t:variable>

   <t:template match="doc">
   		<out>
         <t:copy-of select="$v"/>
      </out>
	  </t:template>
</t:transform>
