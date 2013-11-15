<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
       
  
   <!-- within a streaming template, apply-templates with atomic parameters -->
    
   <xsl:mode streamable="yes"/>
        
   <xsl:output method="xml" indent="no" encoding="UTF-8" />
 
   <xsl:strip-space elements="*"/>
     
   <xsl:template name="main">
     <out>
       <xsl:stream href="mixed.xml">
         <xsl:apply-templates select=".">
           <xsl:with-param name="p" select="17"/> <!-- implicitly passed through first built-in template -->
         </xsl:apply-templates>
       </xsl:stream>
     </out>
   </xsl:template>
   
   
   <xsl:template match="coverpg|preface|titlepg"/>
   
   <xsl:template match="node()">
     <xsl:param name="p" required="yes"/>
     <xsl:copy>
       <xsl:apply-templates select="@*"/>
       <xsl:attribute name="level" select="$p"/>
       <xsl:apply-templates>
         <xsl:with-param name="p" select="$p + 1"/>
       </xsl:apply-templates>  
     </xsl:copy>
   </xsl:template>
   
   <xsl:template match="@*">
     <xsl:copy/>
   </xsl:template>
   
   <xsl:template match="v|@length"/>
  
    
</xsl:transform>

