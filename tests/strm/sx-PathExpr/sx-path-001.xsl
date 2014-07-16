<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Test of xsl:stream with several root path expressions -->
    
    <xsl:template name="xsl:initial-template">
      <xsl:variable name="doc" select="doc('../docs/books.xml')" />
      <xsl:variable name="root1">
        <xsl:stream href="../docs/books.xml">
          <xsl:copy-of select="/"/>
        </xsl:stream>
      </xsl:variable>
      <xsl:variable name="root2">
        <xsl:stream href="../docs/books.xml">
          <xsl:copy-of select="/BOOKLIST"/>
        </xsl:stream>
      </xsl:variable>
      <xsl:variable name="root3">
        <xsl:stream href="../docs/books.xml">
          <xsl:copy-of select="*"/>
        </xsl:stream>
      </xsl:variable>
      <xsl:variable name="root4">
        <xsl:stream href="../docs/books.xml">
          <xsl:copy-of select="/*/self::node()[1]"/>
        </xsl:stream>
      </xsl:variable>
      <out>
        <xsl:value-of select="
          deep-equal($doc, $root1) and 
          deep-equal($doc, $root2) and
          deep-equal($doc, $root3) and 
          deep-equal($doc, $root4)" />
      </out>
    </xsl:template>   
    
</xsl:stylesheet>