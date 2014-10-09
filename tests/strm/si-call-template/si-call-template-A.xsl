<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs err">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test of xsl:stream with xsl:call-template with a grounded context node -->
    
    <xsl:template name="c-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM/copy-of(.)">
             <xsl:call-template name="c-001a"/>
          </xsl:for-each>   
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:template name="c-001a">
      <xsl:copy-of select="PRICE"/>
    </xsl:template>
    

    

                                              
    
</xsl:stylesheet>