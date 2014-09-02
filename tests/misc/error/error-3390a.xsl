<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

              <!--If the accumulator is declared with the attribute streamable="yes"
                  then it is a dynamic error if the accumulator-before or
                  accumulator-after function is called unless the context
                  item at the point of evaluating this function is the same node as the context item
                  for the evaluation of the controlling sequence constructor.-->
                  
   <xsl:accumulator name="a" streamable="yes" initial-value="0">
     <xsl:accumulator-rule match="*" select="$value+1"/>
   </xsl:accumulator>
   
   <xsl:template name="main">
      <out>
         <xsl:stream href="error-0700a.xsl">
           <xsl:for-each select="*/*">
             <xsl:value-of select="../accumulator-before('a')"/>
           </xsl:for-each>  
         </xsl:stream>
      </out>
   </xsl:template>
</xsl:stylesheet>
