<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Simple use of xsl:stream with not() -->
    
    <xsl:template name="c-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(.//ITEM)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not(), filtered with motionless predicate -->
    
    <xsl:template name="c-002" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="not(./BOOKLIST/BOOKS/ITEM[@CAT='P'])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() applied to ancestor nodes-->
    
    <xsl:template name="c-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! not(ancestor::*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() applied to a grounded consuming sequence -->
    
    <xsl:template name="c-004" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(/BOOKLIST/BOOKS/ITEM/DIMENSIONS!tokenize(., ' '))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() applied to attributes of ancestor nodes-->
    
    <xsl:template name="c-005" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! not(ancestor-or-self::*/@*)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() applied to namespaces of ancestor nodes-->
    
    <xsl:template name="c-006" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! not(ancestor-or-self::*/namespace::*)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() with empty downwards selection-->
    
    <xsl:template name="c-007" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(BOOKS)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() with empty downwards selection with predicate-->
    
    <xsl:template name="c-008" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(BOOKS/BOOK[2])"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() with a striding(?) union -->
    
    <xsl:template name="c-009" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(BOOKLIST/BOOKS | BOOKLIST/CATEGORIES)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() with a crawling union -->
    
    <xsl:template name="c-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(.//* | .//text())"/>
        </out>
      </xsl:stream>
    </xsl:template>  
    
    <!-- simple motionless not() -->
    
    <xsl:template name="c-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:if test="child::BOOKLIST">
            <xsl:value-of select="not(true())"/>
          </xsl:if>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() filtered grounded sequence -->
    
    <xsl:template name="c-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(remove(data(//DIMENSIONS/text()), 3))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() filtered striding sequence -->
    
    <xsl:template name="c-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(remove(/BOOKLIST/BOOKS/ITEM, 3))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() twice-filtered striding sequence -->
    
    <xsl:template name="c-014" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="not(remove(/BOOKLIST/BOOKS/ITEM, 3)[@CAT='MMP'])"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() applied to a non-existent element -->
    
    <xsl:template name="c-015" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(account/transaction/details)"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() applied to an existent attribute (can exit early) -->
    
    <xsl:template name="c-016" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(account/transaction/@value)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with not() and a not filter -->
    
    <xsl:template name="c-017" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(account/transaction[@value &gt; 10000000])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream with not() and both a positional and a not filter -->
    
    <xsl:template name="c-018" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(account/transaction[position() lt 20][@value &gt; 1000])"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-100" use-when="$RUN">
      <xsl:variable name="b" select="current-date() gt xs:date('1900-01-01')"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(($b, account/transaction/dummy))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-101" use-when="$RUN">
      <xsl:variable name="b" select="current-date() gt xs:date('1900-01-01')"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not((account/transaction/dummy, $b))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-102" use-when="$RUN">
      <xsl:variable name="b" select="current-date() gt xs:date('1900-01-01')"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not((account/transaction, $b))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-103" use-when="$RUN">
      <xsl:variable name="b" select="current-date() gt xs:date('1900-01-01')"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(($b, account/transaction))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on an xs:anyURI -->
    
    <xsl:template name="c-104" use-when="$RUN">
      <xsl:variable name="b" select="current-date() gt xs:date('1900-01-01')"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not(account/transaction[1]/base-uri(.))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- not() on an xs:date -->
    
    <xsl:template name="c-105" use-when="$RUN">
      <xsl:variable name="b" select="current-date()"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="not((account/transaction[888888], $b))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- not() on an xs:date; error is caught -->
    
    <xsl:template name="c-106" use-when="$RUN">
      <xsl:variable name="b" select="current-date()"/>
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:try>
            <xsl:value-of select="not((account/transaction[888888], $b))"/>
            <xsl:catch errors="*:FORG0006" select="'caught'"/>
          </xsl:try>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- test that streaming resumes OK after a caught error -->
    
    <xsl:template name="c-107" use-when="$RUN">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:for-each select="account/transaction">
            <t>            
              <xsl:try>
                <xsl:value-of select="not(xs:double(concat('-', @value)))"/>
                <xsl:catch errors="*:FORG0001" select="'invalid'"/>
              </xsl:try>
            </t>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>          
              
    
</xsl:stylesheet>