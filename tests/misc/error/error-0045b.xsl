<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="3.0" 
   default-mode="does-not-exist">

                    <!--                       
                       Tests several variants of invocation that relate to throwing or not throwing the 
                       following error:
                       
                       It is a non-recoverable dynamic
                        error if the invocation of the stylesheet specifies an initial 
                        mode (other than the default mode) that does not match the
                        expanded QName in the
                        mode attribute of any template defined in the stylesheet.
                    -->
                    
   <xsl:template name="main">
      <out />
   </xsl:template>
</xsl:stylesheet>

