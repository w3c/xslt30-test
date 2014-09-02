<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

           <!--It is a dynamic error if an xsl:evaluate
               instruction is evaluated when use of xsl:evaluate is disabled.
            -->
            
   <xsl:template name="main">
      <out>
         <xsl:message error-code="Q{http://www.w3.org/2005/xqt-errors}XTDE3175">Test not yet implemented</xsl:message>
         <x/>
      </out>
   </xsl:template>
   
</xsl:stylesheet>
