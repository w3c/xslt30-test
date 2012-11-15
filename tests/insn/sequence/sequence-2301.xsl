<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: xsl:sequence - node identity should be preserved -->

   <xslt:output method="xml" encoding="UTF-8"/>

   <xslt:template match="/">

      <xslt:variable name="nodeseq" as="item()*">
         <xslt:sequence select="(doc/one,doc/two)"/>
      </xslt:variable>
      <out>
         <xslt:value-of select="$nodeseq[1] is doc/one"/>
         <xslt:value-of select="$nodeseq[2] is doc/two"/>
      </out>
   </xslt:template>
</xslt:transform>
