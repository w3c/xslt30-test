<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

          <!-- It is a type error if the result of evaluating
               the xsl:on-empty attribute on a literal result element
               does not satisfy the required type element()?. That is, the expression must
               deliver either a single element node, or an empty sequence.-->
               
   <xsl:variable name="v"><z/></xsl:variable>
   
   <xsl:template name="main">
      <out>
         <x xsl:on-empty="$v">
           <xsl:for-each select="1 to 10[. gt 50]"><q/></xsl:for-each>
         </x>
      </out>
   </xsl:template>
</xsl:stylesheet>
