<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:f="http://example.com/f">
              <!--Furthermore, if the for-each-source attribute is present, the only permitted value 
               (and the default value) of the streamable attribute is yes..-->
               
               <!-- TODO: no longer true -->
   <xsl:template name="main">
      <out>
         <xsl:merge>
           <xsl:merge-source
             for-each-source="'error-0010a.xsl', 'error-0010b.xsl'"
             streamable="no"
             select=".">
             <xsl:merge-key select="."/>
           </xsl:merge-source>
           <xsl:merge-action/>
         </xsl:merge>            
      </out>
   </xsl:template>
   
</xsl:stylesheet>
