<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: Test string rendition of certain numbers that are not backward compatible. -->

   <xslt:output method="xml" encoding="UTF-8" indent="no"/>

   <xslt:template match="/" version="1.0">
      <out>
         <xslt:text>
</xslt:text>
         <posInf>
            <xslt:value-of select="string(xs:float('INF'))"/>
         </posInf>
         <xslt:text>
</xslt:text>
         <negInf>
            <xslt:value-of select="string(xs:float('-INF'))"/>
         </negInf>
         <xslt:text>
</xslt:text>
         <negZero>
            <xslt:value-of select="string(xs:float(-0))"/>
         </negZero>
         <xslt:text>
</xslt:text>
         <small>
            <xslt:value-of select="string(xs:float(0.00000001))"/>
         </small>
         <xslt:text>
</xslt:text>
         <large>
            <xslt:value-of select="string(xs:float(10000000))"/>
         </large>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>
</xslt:transform>
