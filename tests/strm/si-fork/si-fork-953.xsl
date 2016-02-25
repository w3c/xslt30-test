<xsl:transform version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs err">
    
  <!-- Non-streamable fork/for-each-group: 2 down-selections from current-group() -->
  
  <xsl:template name="xsl:initial-template">
    <xsl:stream href="../docs/books.xml">
      <out>
          <xsl:fork>
            <xsl:for-each-group select="/BOOKLIST/BOOKS/ITEM" group-by="@CAT">
              <xsl:sort select="position()"/>
              <in>
                <xsl:sequence select="current-group()/AUTHOR"/>
              </in>
            </xsl:for-each-group>
          </xsl:fork>
      </out>  
    </xsl:stream>
  </xsl:template>
  
  
</xsl:transform>  