<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0">
<!-- Purpose: Test type of global xsl:variable where @select contains an xs:anyURI, @as="xs:string".(type promotion)  -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:variable name="var1"
                  select="xs:anyURI('http://www.w3.org/2001/XMLSchema')"
                  as="xs:string"/>

   <xslt:template match="/doc">
      <out>
         <var1>
            <xslt:value-of select="$var1 instance of xs:anyURI"/>
            <xslt:value-of select="$var1 instance of xs:string"/>
         </var1>
      </out>
   </xslt:template>
</xslt:transform>
