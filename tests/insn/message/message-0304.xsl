<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: Test case to verify that in an xsl:messsage instruction Zero-length 
  				text nodes within the result sequence are removed. -->

   <xslt:template match="/">
		    <xslt:variable name="zero-length-string" as="xs:string">
  			    <xslt:value-of select="''"/>
		    </xslt:variable>
		    <xslt:variable name="zero-length-text" as="text()">
  			    <xslt:text/>
		    </xslt:variable>
   		<out>
         <xslt:message select="'Error Message:'">
   				     <xslt:value-of select="('a', '', 'b', $zero-length-string, 'c', $zero-length-text,'d', no-such-node,'e')"
                           separator="|"/>
   			   </xslt:message>
      </out>
	  </xslt:template>

   <xslt:template match="text()"/>
</xslt:transform>
