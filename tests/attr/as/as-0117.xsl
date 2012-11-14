<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0">
<!-- Purpose: Test type of global xsl:variable where @select contains an xs:integer, 
  				@as="xs:decimal".(subtype substitution)  -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:variable name="var1" select="xs:integer(-300)" as="xs:decimal"/>

   <xslt:template match="/doc">
      <out>
         <xslt:text>
</xslt:text>
         <var1>
            <xslt:value-of select="$var1 instance of xs:integer"/>
            <xslt:value-of select="$var1 instance of xs:decimal"/>
         </var1>
      </out>
   </xslt:template>
</xslt:transform>
