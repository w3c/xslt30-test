<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://www.w3.org/xslt30tests/filter"
    exclude-result-prefixes="map xs f">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:function name="f:test" as="xs:boolean">
      <xsl:param name="arg" as="item()"/>
      <xsl:sequence select="string-length($arg) gt 4"/>
    </xsl:function>  
     
    <!-- Streaming filter(): grounded operand -->
    
    <xsl:template name="r-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(data(/BOOKLIST/BOOKS/ITEM/PRICE), f:test#1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="filter(copy-of(/BOOKLIST/BOOKS/ITEM/PRICE), f:test#1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): grounded atomic operand -->
    
    <xsl:template name="r-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="/BOOKLIST/BOOKS/ITEM/DIMENSIONS ! filter(tokenize(., ' '), f:test#1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="count(filter(/BOOKLIST/BOOKS/ITEM/PRICE, f:test#1))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="sum(filter(/BOOKLIST/BOOKS/ITEM/PRICE, f:test#1))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM/PRICE, f:test#1)[position() mod 2 = 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM/PRICE, f:test#1) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, focus-controlled usage -->
    
    <!-- Saxon 26 Nov 2013. Failing. A for-each that returns streamed nodes
         can't currently be handled by a ComposingWatch. Need to generalize
         TransmissionAdjunct -->
    
    <xsl:template name="r-014" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1] ! filter(*, f:test#1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, focus-setting usage -->
    
    <xsl:template name="r-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="filter(/BOOKLIST/BOOKS/ITEM/PRICE, f:test#1)">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="filter(*, f:test#1)"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>    
    
    <!-- Streaming filter(): striding operand, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM[1]/*, f:test#1) ! contains(name(), 'E')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): striding operand, apply-templates usage -->
    
    <xsl:template name="r-018" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:apply-templates select="filter(/BOOKLIST/BOOKS/ITEM[1]/*, f:test#1)" mode="r-018-mode"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:mode name="r-018-mode" streamable="yes" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="."/></xsl:template>
    
    <!-- Streaming filter(): crawling operand, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(filter(//PRICE, f:test#1))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Streaming filter(): crawling operand, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(filter(/BOOKLIST/BOOKS/ITEM[1]//text(), f:test#1))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): crawling operand, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="filter(/BOOKLIST/BOOKS/ITEM[1]//text(), f:test#1)[position() lt 4]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="filter(//PRICE/text(), f:test#1) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, inspection usage -->
    
    <xsl:template name="r-030" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="filter(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*, f:test#1) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, inspection usage, removal of duplicates -->
    
    <xsl:template name="r-031" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="filter(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor::*, f:test#1) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@*, f:test#1)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM/ancestor-or-self::*/@CAT, f:test#1)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/@CAT, f:test#1)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming filter(): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="filter(//PRICE/ancestor-or-self::*/@*, f:test#1)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>               
    
</xsl:stylesheet>