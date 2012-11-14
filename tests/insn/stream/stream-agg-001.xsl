<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Simple use of xsl:stream with count() -->
    
    <xsl:template name="main">
      <xsl:stream href="books.xml">
        <out>
          <xsl:value-of select="count(.//ITEM)"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
</xsl:stylesheet>