<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="3.0">
  
   <xsl:variable name='sysprop' static="yes" select="function-lookup(QName('http://www.w3.org/2005/xpath-functions', 'system-property'), 1)" />
  
   <xsl:template name="xsl:initial-template">
     <result>
       <xsl:value-of select="$sysprop('xsl:version') = '3.0'"/>
     </result>
   </xsl:template>
</xsl:transform>
