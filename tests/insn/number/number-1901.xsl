<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0">
   
   <!-- Test use of current() function in a predicate of xsl:number/@count -->

   <xsl:output method="text"/>

   <xsl:template match="/">
     <xsl:for-each select="root/foo">
       <xsl:variable name="n" as="xs:integer">
         <xsl:number count="foo[@bar = current()/@bar]"/>
       </xsl:variable>
       <xsl:value-of select="concat($n, '&#10;')"/>
     </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>