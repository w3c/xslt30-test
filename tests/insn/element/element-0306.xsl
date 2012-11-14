<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:fun="http://www.funJobs.com"
             xmlns:easy="http://www.easyJobs.com"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             version="2.0">
<!-- Purpose: Test case that uses inherit-namespaces = "yes" inherit-namespaces = "no"
  				on different xsl:element instructions to verify the effect of the 
  				inherit-namespaces attribute on differents levels of elements 
  				(parent, child, grandchild). -->

   <t:template match="doc">
	     <out>
         <t:element xmlns="http://www.dummy_ns.com"
                    name="profession"
                    inherit-namespaces="no">
   			      <t:element name="IT_architect"/>
   			      <t:text>
</t:text>
   			      <t:element name="IT_Specialist"
                       namespace="http://www.all.com"
                       inherit-namespaces="yes">
   				        <t:value-of select="namespace::*"/>
   			      </t:element>
   			      <t:text>
</t:text>
   			      <t:element name="Busines_Analyst"/>
   			      <t:text>
</t:text>
   		    </t:element>
         <t:text>
</t:text>
      </out>
	  </t:template>
</t:transform>
