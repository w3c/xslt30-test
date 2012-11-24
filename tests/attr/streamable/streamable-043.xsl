<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0">
       
   
   <!-- within a streaming template, test non-existence of a descendant node -->
    
   <xsl:mode streamable="yes"/>
        
   <xsl:output method="xml" indent="yes" encoding="UTF-8" />
   
   <xsl:strip-space elements="*"/>
     
   <xsl:template name="main">
     <out>
       <xsl:apply-templates select="doc('loans.xml')"/>
     </out>
   </xsl:template>
    
   <xsl:template match="*">
     <xsl:copy>
       <xsl:copy-of select="@*"/>
       <xsl:apply-templates/>
     </xsl:copy>
   </xsl:template>
   
   <xsl:template match="Loan">
     <empty><xsl:value-of select="empty(.//NonsenseElement)"/></empty>
   </xsl:template>
     
</xsl:transform>
