<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="map xs err">

  <xsl:variable name="RUN" select="true()" static="yes"/>
  <xsl:strip-space elements="*"/>

  <!-- This test set is derived by direct conversion of si-attribute-A to use elements instead of attributes -->


  <!-- Test of xsl:stream with xsl:element -->

  <xsl:template name="s-003" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PRICE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered with a motionless predicate -->

  <xsl:template name="s-004" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM[@CAT='P']/PRICE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered with a positional predicate -->

  <xsl:template name="s-005" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM[position() lt 4]/PRICE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered with a positional predicate -->

  <xsl:template name="s-006" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/*[position() lt 4]/PRICE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered with a positional predicate -->

  <xsl:template name="s-007" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="/BOOKLIST/BOOKS/*:ITEM[position() lt 4]/PRICE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered using data() to make it streamable -->

  <xsl:template name="s-008" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PAGES/data()[. &lt; 1000][. &gt; 0]"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered using text() to make it streamable -->

  <xsl:template name="s-009" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="BOOKLIST/BOOKS/ITEM/PAGES/text()[. &lt; 1000][. &gt; 0]"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered using number() to make it streamable -->

  <xsl:template name="s-010" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="/BOOKLIST/BOOKS/ITEM/PAGES/number()[. &lt; 1000][. &gt; 0]"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, selecting nothing  -->

  <xsl:template name="s-011" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="ITEM/PAGES"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:element selecting both streamed nodes and literals -->

  <xsl:template name="s-012" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PAGES/number(), 31, 32"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:element selecting both streamed nodes and literals while also filtering -->

  <xsl:template name="s-013" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="tail(./BOOKLIST/BOOKS/ITEM/PAGES)/number(), 31, 32"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element of a computed value -->

  <xsl:template name="s-015" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence
            select="for $d in data(outermost(//DIMENSIONS))
                                return let $x := tokenize($d, '\s')!number() 
                                       return round($x[1]*$x[2]*$x[3], 3)"
          />
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element of a computed value -->

  <xsl:template name="s-016" use-when="$RUN">
    <xsl:stream href="../docs/big-transactions.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="account/transaction[position() lt 5]/(@value*2)"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element, filtered using copy-of() to make it streamable -->

  <xsl:template name="s-017" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PAGES/copy-of()[. &lt; 1000][. &gt; 0]"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element applied to an attribute -->

  <xsl:template name="s-018" use-when="$RUN">
    <xsl:stream href="../docs/big-transactions.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="account/transaction[position() lt 5]/@value"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element over attribute values, filtered -->

  <xsl:template name="s-019" use-when="$RUN">
    <xsl:stream href="../docs/big-transactions.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="account/transaction/@value[xs:decimal(.) lt -8.00]"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element over attribute values, computed -->

  <xsl:template name="s-020" use-when="$RUN">
    <xsl:stream href="../docs/big-transactions.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="account/transaction[position() mod 10 = 1]/abs(@value)"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element of a conditional value -->

  <xsl:template name="s-021" use-when="$RUN">
    <xsl:stream href="../docs/big-transactions.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence
            select="account/transaction/
                (if (xs:date(@date) lt xs:date('2020-01-01')) then +@value else (@value+1))"
          />
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element with a loop used to compute each item -->

  <xsl:template name="s-022" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="BOOKLIST/BOOKS/ITEM/DIMENSIONS!xs:NMTOKENS(.)!xs:decimal(.)"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream calling xsl:element using outermost(//x/y) -->

  <xsl:template name="s-023" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="outermost(//ITEM/DIMENSIONS)!xs:NMTOKENS(.)!xs:decimal(.)"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: grounded operand, selects nothing -->

  <xsl:template name="s-040" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="data(/*/*/NOTHING)"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: striding operand, selects nothing -->

  <xsl:template name="s-041" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="/BOOKLIST/BOOKS/MAGAZINE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: crawling operand, selects nothing -->
  <!-- TODO: not guaranteed streamable -->

  <xsl:template name="s-042" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="/*/*/MAGAZINE"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: climbing operand, selects nothing -->

  <xsl:template name="s-043" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="//PRICE/../@nothing"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: complex content -->

  <xsl:template name="s-046" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="PRICE"/>
            <xsl:text>]</xsl:text>
          </xsl:for-each>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: name is consuming  -->

  <xsl:template name="s-047" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="{translate(head(//AUTHOR), ' ', '_')}">value</xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Streaming xsl:element: namespace is consuming  -->

  <xsl:template name="s-048" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a"
          namespace="http://{lower-case(translate(head(//AUTHOR), ' ', '_'))}.com/"
          >value</xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty (not empty) -->

  <xsl:template name="s-050" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PRICE/data()"/>
          <xsl:on-empty/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty (empty) -->

  <xsl:template name="s-051" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <xsl:element name="a">
            <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PRICETAG"/>
          </xsl:element>
        </xsl:conditional-content>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty, with on-empty consuming (not empty) -->

  <xsl:template name="s-052" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <xsl:element name="a">
            <xsl:sequence select="1 to 10"/>
          </xsl:element>
        </xsl:conditional-content>
        <xsl:on-empty select="head(//*)"/>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty, with on-empty consuming (empty) -->

  <xsl:template name="s-053" use-when="$RUN">
    <xsl:param name="s" select="20"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <xsl:element name="a">
            <xsl:sequence select="$s to 10"/>
          </xsl:element>
        </xsl:conditional-content>
        <xsl:on-empty select="head(//TITLE)"/>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty (empty, returns a new element) -->

  <xsl:template name="s-054" use-when="$RUN">
    <xsl:variable name="e" as="element()">
      <e/>
    </xsl:variable>
    <xsl:stream href="../docs/books.xml">
      <xsl:for-each select="BOOKLIST/BOOKS">
        <out>
          <xsl:conditional-content>
            <xsl:element name="a">
              <xsl:sequence select="ITEM/PRICETAG"/>
            </xsl:element>
          </xsl:conditional-content>
          <xsl:on-empty select="$e"/>
        </out>
      </xsl:for-each>
    </xsl:stream>
  </xsl:template>

  <!-- Test of xsl:stream with xsl:element/@on-empty (empty, no longer a type error, returns two elements) -->

  <xsl:template name="s-055" use-when="$RUN">
    <xsl:param name="n" select="2"/>
    <xsl:variable name="atts" as="element()*">
      <xsl:for-each select="1 to $n">
        <xsl:element name="n{.}">
          <xsl:sequence select="."/>
        </xsl:element>
      </xsl:for-each>
    </xsl:variable>
    <xsl:stream href="../docs/books.xml">
      <xsl:for-each select="BOOKLIST/BOOKS">
        <out>
          <xsl:conditional-content>
            <xsl:element name="a">
              <xsl:sequence select="ITEM/PRICETAG"/>
            </xsl:element>
          </xsl:conditional-content>
          <xsl:on-empty select="$atts"/>
        </out>
      </xsl:for-each>
    </xsl:stream>
  </xsl:template>



  <!-- xsl:element content cannot contain a function item - error -->

  <xsl:template name="s-057" use-when="$RUN">
    <xsl:param name="s" select="false#0"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a">
          <xsl:sequence select="1, 2, head(//text()), $s"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element content cannot contain a function item - error - recovered -->

  <xsl:template name="s-058" use-when="$RUN">
    <xsl:param name="s" select="false#0"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:try>
          <xsl:element name="a">
            <xsl:sequence select="1, 2, head(//text()), $s"/>
          </xsl:element>
          <xsl:catch errors="*:FOTY0013">caught</xsl:catch>
        </xsl:try>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element invalid name - error -->

  <xsl:template name="s-059" use-when="$RUN">
    <xsl:param name="s" select="'#'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="{$s}">
          <xs:sequence select="1, 2, head(//text())"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element invalid name - error - recovered -->

  <xsl:template name="s-060" use-when="$RUN">
    <xsl:param name="s" select="'#'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:try>
          <xsl:element name="{$s}">
            <xsl:sequence select="1, 2, head(//text())"/>
          </xsl:element>
          <xsl:catch errors="*:XTDE0820">caught</xsl:catch>
        </xsl:try>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element named xmlns - allowed -->

  <xsl:template name="s-061" use-when="$RUN">
    <xsl:param name="s" select="'xmlns'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="{$s}">
          <xsl:sequence select="1, 2, head(//text())"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element prefix not declared - error -->

  <xsl:template name="s-063" use-when="$RUN">
    <xsl:param name="s" select="'a:b'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="{$s}">
          <xsl:sequence select="1, 2, head(//text())"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element prefix not declared - error - recovered -->

  <xsl:template name="s-064" use-when="$RUN">
    <xsl:param name="s" select="'a:b'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:try>
          <xsl:element name="{$s}">
            <xsl:sequence select="1, 2, head(//text())"/>
          </xsl:element>
          <xsl:catch errors="*:XTDE0830">caught</xsl:catch>
        </xsl:try>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element disallowed namespace - error -->

  <xsl:template name="s-065" use-when="$RUN">
    <xsl:param name="s" select="'http://www.w3.org/2000/xmlns/'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:element name="a:b" namespace="{$s}">
          <xsl:sequence select="1, 2, head(//text())"/>
        </xsl:element>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- xsl:element disallowed namespace - error - recovered -->

  <xsl:template name="s-066" use-when="$RUN">
    <xsl:param name="s" select="'http://www.w3.org/2000/xmlns/'"/>
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:try>
          <xsl:element name="a:b" namespace="{$s}">
            <xsl:sequence select="1, 2, head(//text())"/>
          </xsl:element>
          <xsl:catch errors="*:XTDE0835">caught</xsl:catch>
        </xsl:try>
      </out>
    </xsl:stream>
  </xsl:template>




</xsl:stylesheet>
