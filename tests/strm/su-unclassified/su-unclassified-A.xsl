<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://www.w3.org/xslt30tests/functions"
    exclude-result-prefixes="map xs err f">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test zero-arity unclassified function -->
    
    <xsl:function name="f:f-001" streamability="unclassified">
      <xsl:sequence select="42"/>
    </xsl:function>
    
    <xsl:template name="t-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[position() ne f:f-001()]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test arity=1 unclassified function that atomizes first argument -->
    
    <xsl:function name="f:f-002" streamability="unclassified">
      <xsl:param name="in" as="xs:decimal*"/>
      <xsl:sequence select="round(avg($in), 2)"/>
    </xsl:function>
    
    <xsl:template name="t-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="f:f-002(/BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test arity=1 unclassified recursive function that atomizes first argument -->
    
    <xsl:function name="f:f-003" streamability="unclassified">
      <xsl:param name="in" as="xs:decimal*"/>
      <xsl:sequence select="round(avg((head($in), f:f-003(tail($in)))))"/>
    </xsl:function>
    
    <xsl:template name="t-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="f:f-003(/BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test arity=2 unclassified function that atomizes first argument -->
    
    <xsl:function name="f:f-004" streamability="unclassified">
      <xsl:param name="in" as="xs:decimal*"/>
      <xsl:param name="two" as="xs:decimal"/>
      <xsl:sequence select="round(avg($in), 2) + $two"/>
    </xsl:function>
    
    <xsl:template name="t-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="f:f-004(/BOOKLIST/BOOKS/ITEM/PRICE, 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test arity=2 unclassified recursive function that atomizes first argument -->
    
    <xsl:function name="f:f-005" streamability="unclassified">
      <xsl:param name="in" as="xs:decimal*"/>
      <xsl:param name="two" as="xs:decimal"/>
      <xsl:sequence select="round(avg((head($in), f:f-005(tail($in), $two)))) + $two"/>
    </xsl:function>
    
    <xsl:template name="t-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="f:f-005(/BOOKLIST/BOOKS/ITEM/PRICE, 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
        

</xsl:stylesheet>