<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: Range expression - nested range expression -->

   <xslt:template match="/">
      <out>
         <xslt:value-of select="((1 to doc/one) to (1 to 1)) to (5 to (2+3))"/>
      </out>
   </xslt:template>
</xslt:transform>
