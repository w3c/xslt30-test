<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

              <!--It is a type error if the result of evaluating
                  the on-empty attribute on the xsl:element instruction
                  does not satisfy the required type element()?. That is, the expression must
                  deliver either a single element node, or an empty sequence.-->
                  
   <xsl:variable name="v"><z/></xsl:variable>
   
   <xsl:template name="main">
      <out>
         <xsl:element name="x" on-empty="$v">
           <xsl:for-each select="1 to 10[. gt 50]"><q/></xsl:for-each>
         </xsl:element>
      </out>
   </xsl:template>
</xsl:stylesheet>
