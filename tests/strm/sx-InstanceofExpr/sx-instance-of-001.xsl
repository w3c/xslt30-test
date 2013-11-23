<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Simple use of xsl:stream with "instance of" -->
    
    <xsl:template name="c-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(.//node()) instance of element()*"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of", filtered with motionless predicate -->
    
    <xsl:template name="c-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(./BOOKLIST/BOOKS/*[@CAT='P']) instance of element(ITEM)*"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" applied to ancestor nodes-->
    
    <xsl:template name="c-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! (ancestor::*) ) instance of element(BOOKLIST)*"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" applied to a grounded consuming sequence -->
    
    <xsl:template name="c-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/DIMENSIONS!tokenize(., ' ')) instance of xs:string+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" applied to attributes of ancestor nodes-->
    
    <xsl:template name="c-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! (ancestor-or-self::*/@*))  instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" applied to namespaces of ancestor nodes-->
    
    <xsl:template name="c-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! (ancestor-or-self::*/namespace::*))  instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- "instance of" with empty downwards selection-->
    
    <xsl:template name="c-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKS) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" with empty downwards selection with predicate-->
    
    <xsl:template name="c-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKS/BOOK[2]) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- "instance of" with a striding(?) union -->
    
    <xsl:template name="c-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(BOOKLIST/BOOKS | BOOKLIST/CATEGORIES) instance of element(BOOKS)+"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- "instance of" with a crawling union -->
    
    <xsl:template name="c-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(.//* | .//text()) instance of text()*"/>
        </out>
      </xsl:stream>
    </xsl:template>  
    
    <!-- simple motionless "instance of" -->
    
    <xsl:template name="c-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:if test="child::BOOKLIST">
            <xsl:value-of select="(1 to 10) instance of xs:anyAtomicType+"/>
          </xsl:if>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" filtered grounded sequence -->
    
    <xsl:template name="c-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(remove(data(//DIMENSIONS/text()), 3)) instance of text()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" filtered striding sequence -->
    
    <xsl:template name="c-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(remove(/BOOKLIST/BOOKS/ITEM, 3)) instance of element()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" twice-filtered striding sequence -->
    
    <xsl:template name="c-014" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(remove(/BOOKLIST/BOOKS/ITEM, 3)[@CAT='MMP']) instance of node()?"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- "instance of" applied to a non-existent element -->
    
    <xsl:template name="c-015">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/details) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- "instance of" applied to an existent attribute (can exit early) -->
    
    <xsl:template name="c-016">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction/@value) instance of attribute()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "instance of" and a boolean filter -->
    
    <xsl:template name="c-017">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction[@value &gt; 10000000]) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with "instance of" and both a positional and a boolean filter -->
    
    <xsl:template name="c-018">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(account/transaction[position() lt 20][@value &gt; 1000]) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-100" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(($b, account/transaction/dummy)) instance of node()+"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-101" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="((account/transaction/dummy, $b)) instance of node()*"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-102" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="((account/transaction, $b)) instance of node()*"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- "instance of" on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-103" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="(($b, account/transaction)) instance of node()*"/>
        </out>
      </xsl:stream>
    </xsl:template>          
    
</xsl:stylesheet>