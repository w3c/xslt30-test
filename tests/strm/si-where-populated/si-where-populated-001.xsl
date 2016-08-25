<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                          version="3.0">

   <xsl:output method="xml" />

   <xsl:mode streamable="yes" on-no-match="shallow-copy"/>

   <xsl:template name="main">
       <xsl:source-document streamable="yes" href="../docs/books.xml">
           <Results>
               <xsl:where-populated>
                 <first>one</first>
                 <second/>
                 <xsl:copy-of select="BOOKLIST/CATEGORIES/*" />
                 <last>last</last>
               </xsl:where-populated>
           </Results>
       </xsl:source-document>
   </xsl:template>

</xsl:stylesheet>
