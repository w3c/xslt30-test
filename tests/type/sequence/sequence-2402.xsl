<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: xsl:sequence instruction is missing the REQUIRED 'select' attribute. -->

   <xslt:template match="doc">
  		  <xslt:variable name="q" as="item() *">
			      <xslt:sequence/>
  		  </xslt:variable>
  		  <out>
         <xslt:value-of select="data($q)" separator=","/>
      </out>
	  </xslt:template>
</xslt:transform>
