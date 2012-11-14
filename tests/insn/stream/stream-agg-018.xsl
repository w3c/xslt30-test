<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://local.functions/"
    exclude-result-prefixes="map xs f">
    
    <!-- Test of xsl:stream calling sum() with a loop used to compute each item -->
    
    <xsl:template name="main">
      <xsl:stream href="books.xml">
        <out>
          <xsl:value-of select="sum(BOOKLIST/BOOKS/ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
</xsl:stylesheet>