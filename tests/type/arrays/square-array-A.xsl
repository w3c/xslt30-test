<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs array">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:variable name="books-doc" select="'../../strm/docs/books.xml'"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="insertion" as="element()*">
      <a>A</a>
      <b>B</b>
    </xsl:variable>
    
    <xsl:variable name="numeric-insertion" as="element()*">
      <a>11</a>
      <b>22</b>
    </xsl:variable>
  
    <xsl:variable name="extraItem" as="element(ITEM)">
      <ITEM CAT="H">
        <TITLE>Ulysses</TITLE>
        <AUTHOR>James Joyce</AUTHOR>
        <PUBLISHER>HarperCollins</PUBLISHER>
        <PUB-DATE>1935-06-02</PUB-DATE>
        <LANGUAGE>English</LANGUAGE>
        <PRICE>18.90</PRICE>
        <QUANTITY>235</QUANTITY>
        <ISBN>0186701805</ISBN>
        <PAGES>830</PAGES>
        <DIMENSIONS UNIT="in">7.2 5.6 1.2</DIMENSIONS>
        <WEIGHT UNIT="oz">11.0</WEIGHT>
      </ITEM>
    </xsl:variable>
    
    <!-- Streaming comma operator: grounded operand -->
    
    <xsl:template name="r-001" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[data(/BOOKLIST/BOOKS/ITEM/PRICE), $insertion]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="[copy-of(/BOOKLIST/BOOKS/ITEM/PRICE), $insertion]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: grounded atomic operand -->
    
    <xsl:template name="r-003" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="/BOOKLIST/BOOKS/ITEM/DIMENSIONS ! [tokenize(., ' '), $insertion]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="array:size([/BOOKLIST/BOOKS/ITEM/PRICE/snapshot(), $insertion])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="sum([/BOOKLIST/BOOKS/ITEM/PRICE/data(), $numeric-insertion])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM/PRICE/data(), $insertion]?*[position() mod 2 = 0]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM/PRICE/data(), $numeric-insertion]?* ! (.+1)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-controlled usage -->
    
    <xsl:template name="r-014" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1] ! [*/copy-of(), $insertion]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-setting usage -->
    
    <xsl:template name="r-015" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:for-each select="[/BOOKLIST/BOOKS/ITEM/PRICE/data(), $numeric-insertion]?*">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="[copy-of(*), $insertion]"/>
          </xsl:for-each>  
        </out>
      </xsl:source-document>
    </xsl:template>    
    
    <!-- Streaming comma operator: striding operand, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM[1]/*/copy-of(), $insertion]?* ! contains(name(), 'E')"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, apply-templates usage -->
    
    <xsl:template name="r-018" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:apply-templates select="[/BOOKLIST/BOOKS/ITEM[1]/* ! snapshot(), $insertion]?*" mode="r-018-mode"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <xsl:mode name="r-018-mode" streamable="no" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="."/></xsl:template>
  
  <!-- Streaming comma operator: striding operand, apply-templates to array -->
  
  <xsl:template name="r-019" use-when="$RUN">
    <xsl:source-document streamable="no" href="{$books-doc}">
      <out>
        <xsl:apply-templates select="[/BOOKLIST/BOOKS/ITEM[1]/* ! snapshot(), $insertion]" mode="r-019-mode"/>
      </out>
    </xsl:source-document>
  </xsl:template>
  
  <xsl:template match=".[. instance of array(*)]" mode="r-019-mode">
    <in><xsl:apply-templates select="?*" mode="r-018-mode"/></in>
  </xsl:template>
  
  
    
    <!-- Streaming comma operator: crawling operand, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="array:size([//PRICE/copy-of(), $insertion])"/>
        </out>
      </xsl:source-document>
    </xsl:template> 
    
    <!-- Streaming comma operator: crawling operand, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="array:size([/BOOKLIST/BOOKS/ITEM[1]//text()/string(), $insertion])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: crawling operand, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="[/BOOKLIST/BOOKS/ITEM[1]//text()/string(), $insertion]?*[position() lt 4]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="[//PRICE/data(), $numeric-insertion]?* ! (.+1)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, inspection usage -->
    
    <xsl:template name="r-030" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="[/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/name(), $insertion/name()]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, inspection usage, removal of duplicates -->
    
    <xsl:template name="r-031" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:copy-of select="[/BOOKLIST/BOOKS/ITEM/PRICE/ancestor::*/name(), $insertion/name()]"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@*!data(), $insertion]" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM/ancestor-or-self::*/@CAT!data(), $insertion]" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[/BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/data(@CAT), $insertion]" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:value-of select="[//PRICE/ancestor-or-self::*/data(@*), $insertion]" separator="|"/>
        </out>
      </xsl:source-document>
    </xsl:template>  
    
    <!-- Streaming comma operator: striding operand, transmission usage (bug 27668) -->
    
    <xsl:template name="r-036" use-when="$RUN">
      <xsl:source-document streamable="no" href="{$books-doc}">
        <out>
          <xsl:for-each select="/*/CATEGORIES/CATEGORY">
            <v><xsl:value-of select="[data(@CODE), data(@DESC)]"/></v>
          </xsl:for-each>
        </out>
      </xsl:source-document>
    </xsl:template>
  
  <!-- Mixed striding and grounded sequence.  -->
  
  <xsl:template name="r-040" use-when="$RUN">
    <xsl:source-document streamable="no" href="{$books-doc}">
      <out>
        <xsl:copy-of select="[$extraItem, /BOOKLIST/BOOKS/ITEM]?*!PRICE"/>
      </out>
    </xsl:source-document>
  </xsl:template> 
  
  <!-- Mixed striding and grounded sequence.  -->
  
  <xsl:template name="r-041" use-when="$RUN">
    <xsl:source-document streamable="no" href="{$books-doc}">
      <out>
        <xsl:copy-of select="[$extraItem, /BOOKLIST/BOOKS/ITEM]?* / PRICE"/>
      </out>
    </xsl:source-document>
  </xsl:template> 
  
  <!-- Mixed striding and grounded sequence.  -->
  
  <xsl:template name="r-042" use-when="$RUN">
    <xsl:source-document streamable="no" href="{$books-doc}">
      <out>
        <xsl:value-of select="[$extraItem, /BOOKLIST/BOOKS/ITEM]?* !PRICE"/>
      </out>
    </xsl:source-document>
  </xsl:template> 
  
  <!-- Mixed striding and grounded sequence.  -->
  
  <xsl:template name="r-043" use-when="$RUN">
    <xsl:source-document streamable="no" href="{$books-doc}">
      <out>
        <xsl:value-of select="[$extraItem, /BOOKLIST/BOOKS/ITEM]?* / PRICE"/>
      </out>
    </xsl:source-document>
  </xsl:template> 
  
  
    
</xsl:stylesheet>