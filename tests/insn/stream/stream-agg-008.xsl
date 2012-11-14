<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Test of xsl:stream with avg(), filtered using copy-of() to make it streamable -->
    
    <xsl:template name="main">
      <xsl:stream href="books.xml">
        <out>
          <xsl:value-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PAGES/copy-of()[. &lt; 1000][. &gt; 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
</xsl:stylesheet>