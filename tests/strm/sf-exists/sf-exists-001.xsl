<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Simple use of xsl:source-document with exists() -->
    
    <xsl:template name="c-001" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(.//ITEM)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists(), filtered with motionless predicate -->
    
    <xsl:template name="c-002" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="exists(./BOOKLIST/BOOKS/ITEM[@CAT='P'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() applied to ancestor nodes-->
    
    <xsl:template name="c-003" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor::*)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() applied to a grounded consuming sequence -->
    
    <xsl:template name="c-004" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(/BOOKLIST/BOOKS/ITEM/DIMENSIONS!tokenize(., ' '))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() applied to attributes of ancestor nodes-->
    
    <xsl:template name="c-005" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor-or-self::*/@*)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() applied to namespaces of ancestor nodes-->
    
    <xsl:template name="c-006" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="BOOKLIST/BOOKS/ITEM[@CAT='MMP'] ! exists(ancestor-or-self::*/namespace::*)"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- exists() with empty downwards selection-->
    
    <xsl:template name="c-007" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKS)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() with empty downwards selection with predicate-->
    
    <xsl:template name="c-008" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKS/BOOK[2])"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- exists() with a striding(?) union -->
    
    <xsl:template name="c-009" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(BOOKLIST/BOOKS | BOOKLIST/CATEGORIES)"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- exists() with a crawling union -->
    
    <xsl:template name="c-010" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(.//* | .//text())"/>
        </out>
      </xsl:source-document>
    </xsl:template>  
    
    <!-- simple motionless exists() -->
    
    <xsl:template name="c-011" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:if test="child::BOOKLIST">
            <xsl:value-of select="exists(1 to 10)"/>
          </xsl:if>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() filtered grounded sequence -->
    
    <xsl:template name="c-012" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(data(//DIMENSIONS/text()), 3))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() filtered striding sequence -->
    
    <xsl:template name="c-013" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(/BOOKLIST/BOOKS/ITEM, 3))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() twice-filtered striding sequence -->
    
    <xsl:template name="c-014" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="exists(remove(/BOOKLIST/BOOKS/ITEM, 3)[@CAT='MMP'])"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- exists() applied to a non-existent element -->
    
    <xsl:template name="c-015">
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction/details)"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- exists() applied to an existent attribute (can exit early) -->
    
    <xsl:template name="c-016">
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction/@value)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Test of xsl:source-document with exists() and a boolean filter -->
    
    <xsl:template name="c-017">
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction[@value &gt; 10000000])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Test of xsl:source-document with exists() and both a positional and a boolean filter -->
    
    <xsl:template name="c-018">
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(account/transaction[position() lt 20][@value &gt; 1000])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-100" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(($b, account/transaction/dummy))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-101" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists((account/transaction/dummy, $b))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-102" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists((account/transaction, $b))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- exists() on a sequence of both streamed nodes and atomic values -->
    
    <xsl:template name="c-103" use-when="$RUN">
      <xsl:variable name="b" select="1[current-date() gt xs:date('1900-01-01')]"/>
      <xsl:source-document streamable="yes" href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="exists(($b, account/transaction))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
  
  <!-- exists() applied to grounded element nodes -->
  
  <xsl:template name="c-104" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! parse-xml('&lt;p a=''3''>' || . || '&lt;/p>')/*)"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <!-- exists() applied to grounded text nodes -->
  
  <xsl:template name="c-105" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! parse-xml('&lt;p a=''3''>' || . || '&lt;/p>')//text())"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <!-- exists() applied to grounded attribute nodes -->
  
  <xsl:template name="c-106" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! parse-xml('&lt;p a=''3''>' || . || '&lt;/p>')//@a)"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <xsl:function name="Q{f}attribute" as="attribute()">
    <xsl:param name="name" as="xs:string"/>
    <xsl:param name="value" as="xs:string"/>
    <xsl:attribute name="{$name}" select="$value"/>
  </xsl:function>
  
  <xsl:function name="Q{f}element" as="element()">
    <xsl:param name="name" as="xs:string"/>
    <xsl:param name="value" as="xs:string"/>
    <xsl:element name="{$name}">
      <xsl:attribute name="x" select="'y'"/>
      <xsl:value-of select="$value"/>
    </xsl:element>
  </xsl:function>
  
  <xsl:function name="Q{f}text" as="text()">
    <xsl:param name="value" as="xs:string"/>
    <xsl:value-of select="$value"/>
  </xsl:function>
  
  <!-- exists() applied to constructed attribute nodes -->
  
  <xsl:template name="c-107" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! Q{f}attribute('x', string(.)))"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <!-- exists() applied to constructed element nodes -->
  
  <xsl:template name="c-108" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! Q{f}element('x', string(.)))"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <!-- exists() applied to constructed text nodes -->
  
  <xsl:template name="c-109" use-when="$RUN">
    <xsl:source-document streamable="yes" href="../docs/books.xml">
      <out>
        <xsl:value-of select="exists(outermost(//PRICE) ! Q{f}text(string(.)))"/>
      </out>
    </xsl:source-document>
  </xsl:template>
    
</xsl:stylesheet>