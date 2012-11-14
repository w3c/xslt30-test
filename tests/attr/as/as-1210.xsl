<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test of several templates which contain document, element,attribute, 
				comment, text or processing-instruction nodes and have @as="node()". -->

   <t:template match="/">
      <out>
         <t:text>
</t:text>
         <e1>
            <t:call-template name="a1"/>
         </e1>
         <t:text>
</t:text>
         <e2>
            <t:call-template name="a2"/>
         </e2>
         <t:text>
</t:text>
         <e3>
            <t:call-template name="a3"/>
         </e3>
         <t:text>
</t:text>
         <e4>
            <t:call-template name="a4"/>
         </e4>
         <t:text>
</t:text>
         <e5>
            <t:call-template name="a5"/>
         </e5>
         <t:text>
</t:text>
         <e6>
            <t:call-template name="a6"/>
         </e6>
         <t:text>
</t:text>
         <e21>
            <t:call-template name="a21"/>
         </e21>
         <t:text>
</t:text>
         <e31>
            <t:call-template name="a31"/>
         </e31>
         <t:text>
</t:text>
         <e41>
            <t:call-template name="a41"/>
         </e41>
         <t:text>
</t:text>
         <e51>
            <t:call-template name="a51"/>
         </e51>
         <t:text>
</t:text>
         <e61>
            <t:call-template name="a61"/>
         </e61>
      </out>
   </t:template>

   <t:template name="a1" as="node()">
	     <t:document>
		       <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">hello</item>
	     </t:document>
   </t:template>

   <t:template name="a2" as="node()">
	     <t:copy-of select="doc/item"/>
   </t:template>

   <t:template name="a3" as="node()">
	     <t:copy-of select="doc/item/@attrib"/>
   </t:template>

   <t:template name="a4" as="node()">
	     <t:copy-of select="/doc/processing-instruction()"/>
   </t:template>

   <t:template name="a5" as="node()">
	     <t:copy-of select="/doc/item/text()"/>
   </t:template>

   <t:template name="a6" as="node()">
	     <t:copy-of select="/doc/item/comment()"/>
   </t:template>

   <t:template name="a21" as="node()">
	     <t:element name="e1">element</t:element>
   </t:template>

   <t:template name="a31" as="node()">
	     <t:attribute name="e1">attribute</t:attribute>
   </t:template>

   <t:template name="a41" as="node()">
	     <t:processing-instruction name="e1">PI</t:processing-instruction>
   </t:template>

   <t:template name="a51" as="node()">
	     <t:text>text</t:text>
   </t:template>

   <t:template name="a61" as="node()">
	     <t:comment>comment</t:comment>
   </t:template>
</t:transform>
