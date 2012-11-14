<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="xs">
<!-- Purpose: Test string() of float or double infinity, positive or negative, explicitly constructed. -->

   <xslt:output method="xml" encoding="UTF-8" indent="no"/>

   <xslt:template match="/" version="1.0">
      <out>
         <xslt:text>
</xslt:text>
         <floatPos>
            <xslt:value-of select="string(xs:float('INF'))"/>
         </floatPos>
         <xslt:text>
</xslt:text>
         <floatNeg>
            <xslt:value-of select="string(xs:float('-INF'))"/>
         </floatNeg>
         <xslt:text>
</xslt:text>
         <doublePos>
            <xslt:value-of select="string(xs:double('INF'))"/>
         </doublePos>
         <xslt:text>
</xslt:text>
         <doubleNeg>
            <xslt:value-of select="string(xs:double('-INF'))"/>
         </doubleNeg>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>
</xslt:transform>
