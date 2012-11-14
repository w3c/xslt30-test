<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Test case to verify that any document node within the result sequence is replaced 
  				by a sequence containing each of its children, in document order.-->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:template match="/">
		    <t:document>
			      <t:text>
</t:text>
  			    <out>
            <t:text>
</t:text>
            <t:element name="e1"
                       namespace="http://www.example.org/foo"
                       use-attribute-sets="attset"/>
            <t:text>
</t:text>
            <t:if test="true()">
  				         <t:comment>comment inside xsl:document</t:comment>
  			       </t:if>
            <t:text>
</t:text>
            <t:choose>
  			          <t:when test="false()">
  				            <t:processing-instruction name="Pro1">first pi inside xsl:document</t:processing-instruction>
  			          </t:when>
  			          <t:otherwise>
  				            <t:processing-instruction name="Pro2">last pi inside xsl:document</t:processing-instruction>
  			          </t:otherwise>
  			       </t:choose>
            <t:copy/>
            <t:text>
</t:text>
            <t:document>
               <test/>
            </t:document>
            <t:text>
</t:text>
            <t:apply-templates/>
            <t:text>
</t:text>
         </out>
  		  </t:document>
	  </t:template>

   <t:attribute-set name="attset">
		    <t:attribute name="t1">1</t:attribute>
		    <t:attribute name="t2" select="2"/>
		    <t:attribute name="t3">
			      <t:value-of select="3"/>
		    </t:attribute>
 	</t:attribute-set>

   <t:template match="doc">
 		   <t:element name="e2"> inside child elements</t:element>
 	</t:template>
</t:transform>
