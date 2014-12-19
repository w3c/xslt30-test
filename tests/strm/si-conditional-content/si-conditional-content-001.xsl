<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                          version="3.0">

   <xsl:output method="xml" />

   <xsl:mode streamable="yes" on-no-match="shallow-copy"/>

   <xsl:template name="main">
       <xsl:stream href="../docs/books.xml">
           <Results>
               <xsl:conditional-content>
                 <first>one</first>
                 <second/>
                 <xsl:copy-of select="BOOKLIST/CATEGORIES/*" />
                 <last>last</last>
               </xsl:conditional-content>
           </Results>
       </xsl:stream>
   </xsl:template>

</xsl:stylesheet>
