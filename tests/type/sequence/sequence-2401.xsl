<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: xsl:sequence - Content in the sequence constructor is an instruction other than xsl:fallback.-->

   <xslt:template match="/">
      <out>
         <xslt:sequence select="doc">
            <foo/>
         </xslt:sequence>
      </out>
   </xslt:template>
</xslt:transform>
