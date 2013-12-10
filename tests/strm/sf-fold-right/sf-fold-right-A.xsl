<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://www.w3.org/local-functions"
    exclude-result-prefixes="f map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:function name="f:add" as="xs:double">
      <xsl:param name="x" as="xs:double"/>
      <xsl:param name="y" as="xs:double"/>
      <xsl:sequence select="$x + $y"/>
    </xsl:function>
    
    <!-- TODO: fold-right is defined in the current XSLT 3.0 draft to have the operand usage N (Navigation) making
     it non-streamable, except when the first argument is grounded. In fact it should be non-streamable 
     even when the first argument is grounded, because it processes the items in right-to-left order. -->

    
    <!-- Test of xsl:stream with fold-right() -->
    
    <xsl:template name="s-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="fold-right(./BOOKLIST/BOOKS/ITEM/PRICE/data(), 0, f:add#2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    

</xsl:stylesheet>