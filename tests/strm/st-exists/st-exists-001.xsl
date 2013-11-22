<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Simple use of xsl:stream with exists() -->
    
    <xsl:template name="c-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(.//ITEM)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists(), filtered with motionless predicate -->
    
    <xsl:template name="c-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="exists(./BOOKLIST/BOOKS/ITEM[@CAT='P'])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() applied to ancestor nodes-->
    
    <xsl:template name="c-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor::*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() applied to a grounded consuming sequence -->
    
    <xsl:template name="c-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(/BOOKLIST/BOOKS/ITEM/DIMENSIONS!tokenize(., ' '))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() applied to attributes of ancestor nodes-->
    
    <xsl:template name="c-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor-or-self::*/@*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() applied to namespaces of ancestor nodes-->
    
    <xsl:template name="c-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor-or-self::*/namespace::*)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- exists() with empty downwards selection-->
    
    <xsl:template name="c-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKS)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() with empty downwards selection with predicate-->
    
    <xsl:template name="c-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKS/BOOK[2])"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- exists() with a striding(?) union -->
    
    <xsl:template name="c-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKLIST/BOOKS | BOOKLIST/CATEGORIES)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- exists() with a crawling union -->
    
    <xsl:template name="c-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(.//* | .//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>  
    
    <!-- simple motionless exists() -->
    
    <xsl:template name="c-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:if test="child::BOOKLIST">
            <xsl:value-of select="exists(1 to 10)"/>
          </xsl:if>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() filtered grounded sequence -->
    
    <xsl:template name="c-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(data(//DIMENSIONS/text()), 3))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() filtered striding sequence -->
    
    <xsl:template name="c-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(/BOOKLIST/BOOKS/ITEM, 3))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() twice-filtered striding sequence -->
    
    <xsl:template name="c-014" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(/BOOKLIST/BOOKS/ITEM, 3)[@CAT='MMP'])"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- exists() applied to a non-existent element -->
    
    <xsl:template name="c-015">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction/details)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- exists() applied to an existent attribute (can exit early) -->
    
    <xsl:template name="c-016">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction/@value)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with exists() and a boolean filter -->
    
    <xsl:template name="c-017">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction[@value &gt; 10000000])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with exists() and both a positional and a boolean filter -->
    
    <xsl:template name="c-018">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction[position() lt 20][@value &gt; 1000])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-100" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(($b, account/transaction/dummy))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-101" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists((account/transaction/dummy, $b))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-102" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists((account/transaction, $b))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-103" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(($b, account/transaction))"/>
        </out>
      </xsl:stream>
    </xsl:template>          
    
</xsl:stylesheet>