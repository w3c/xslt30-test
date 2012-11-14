<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://www.examples.com/my"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             version="2.0">
<!-- Purpose: Test case to verify that a document node can contain any sequence of elements, 
  				text nodes, comments, and processing instructions as its children.-->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="root">
	     <t:param name="pi" select="child[2]"/>
		    <out>
         <t:document>
  				      <t:variable name="comment" select="'Valuable comment'"/>
   				     <t:text>
</t:text>
  				      <t:comment select="$comment"/>
  				      <t:text>
</t:text>
  				      <t:element name="new">
  					        <t:attribute name="att1">fresh</t:attribute>
  				      </t:element>
  				      <t:text>
</t:text>
  				      <lre/>
  				      <t:text>
</t:text>
  				      <t:processing-instruction name="my_pi" select="$pi"/>
  				      <t:text>
</t:text>
  				      <t:document>
               <my:child/>
            </t:document>
  				      <t:text>
</t:text>
  				      <t:text>Text Node</t:text>
  				      <t:call-template name="createNode"/>
  				      <t:text>
</t:text>
  				      <t:value-of select="child"/>
  			    </t:document>
         <t:text>
</t:text>
      </out>
	  </t:template>

   <t:template match="child"/>

   <t:template name="createNode">
		    <t:text>
</t:text>
		    <newLRE xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
         <t:element name="ch"/>
      </newLRE>
	  </t:template>
</t:transform>
