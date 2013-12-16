<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>

    
    <!-- Test of xsl:stream with avg() -->
    
    <xsl:template name="s-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PRICE), 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered with a motionless predicate -->
    
    <xsl:template name="s-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="avg(./BOOKLIST/BOOKS/ITEM[@CAT='P']/PRICE)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered with a positional predicate -->
    
    <xsl:template name="s-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="round(avg(./BOOKLIST/BOOKS/ITEM[position() lt 4]/PRICE), 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered with a positional predicate -->
    
    <xsl:template name="s-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="round(avg(./BOOKLIST/BOOKS/*[position() lt 4]/PRICE), 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered with a positional predicate -->
    
    <xsl:template name="s-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:sequence select="round(avg(./BOOKLIST/BOOKS/*:ITEM[position() lt 4]/PRICE), 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered using data() to make it streamable -->
    
    <xsl:template name="s-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PAGES/data()[. &lt; 1000][. &gt; 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered using text() to make it streamable -->
    
    <xsl:template name="s-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PAGES/text()[. &lt; 1000][. &gt; 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered using number() to make it streamable -->
    
    <xsl:template name="s-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PAGES/number()[. &lt; 1000][. &gt; 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), selecting nothing and returning empty result -->
    
    <xsl:template name="s-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(ITEM/PAGES)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of avg() selecting both streamed nodes and literals -->
    
    <xsl:template name="s-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg((./BOOKLIST/BOOKS/ITEM/PAGES/number(), 31, 32))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of avg() selecting both streamed nodes and literals while also filtering -->
    
    <xsl:template name="s-013" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="round(avg((tail(./BOOKLIST/BOOKS/ITEM/PAGES)/number(), 31, 32)), 2)"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
    <!-- Test of xsl:stream with sum of a computed value -->
    
    <xsl:template name="s-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="format-number(avg(for $d in data(//DIMENSIONS)
                                                  return let $x := tokenize($d, '\s')!number() 
                                                  return $x[1]*$x[2]*$x[3]), '99.999')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with sum of a computed value -->
    
    <xsl:template name="s-016" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="xs:integer(round(avg(account/transaction/(@value*2))))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg(), filtered using copy-of() to make it streamable -->
    
    <xsl:template name="s-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="round(avg(./BOOKLIST/BOOKS/ITEM/PAGES/copy-of()[. &lt; 1000][. &gt; 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg() applied to an attribute -->
    
    <xsl:template name="s-018" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="round(avg(account/transaction/@value))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with avg() over attribute values, filtered -->
    
    <xsl:template name="s-019" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="round(avg(account/transaction/@value[xs:decimal(.) gt 0]))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Test of xsl:stream with avg() over attribute values, computed -->
    
    <xsl:template name="s-020" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="round(avg(account/transaction/abs(@value)))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- avg() of a conditional value -->
    
    <xsl:template name="s-021" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="round(avg(account/transaction/
                (if (xs:date(@date) lt xs:date('2020-01-01')) then +@value else (@value+1))))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- avg() with a loop used to compute each item -->
    
    <xsl:template name="s-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(BOOKLIST/BOOKS/ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream calling avg() using //x/y -->
    <!-- Saxon makes this streamable by rewriting //X/Y as .//Y[parent::X] -->
    
    <xsl:template name="s-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(//ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming avg(): grounded operand, selects nothing -->
    
    <xsl:template name="s-040" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(data(//NOTHING))" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming avg(): striding operand, selects nothing -->
    
    <xsl:template name="s-041" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(/BOOKLIST/BOOKS/MAGAZINE)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming avg(): crawling operand, selects nothing -->
    
    <xsl:template name="s-042" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(//MAGAZINE)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming avg(): climbing operand, selects nothing -->
    
    <xsl:template name="s-043" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="avg(//PRICE/../@nothing)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
                                               
    
</xsl:stylesheet>