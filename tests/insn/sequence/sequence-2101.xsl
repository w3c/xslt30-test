<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: range expression with functions as operands -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:template match="/">
      <out>
         <xslt:value-of select="subsequence(doc/num,3,doc/one) to 10"/>
         <xslt:value-of select="32 to remove(doc/num2,doc/one)"/>
         <xslt:value-of select="remove(doc/num2,2) to remove(doc/num2,doc/one)"/>
      </out>
   </xslt:template>
</xslt:transform>
