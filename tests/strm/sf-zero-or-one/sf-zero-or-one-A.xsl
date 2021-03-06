<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Streaming zero-or-one(): grounded operand -->
    
    <xsl:template name="r-001" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="zero-or-one(copy-of(/BOOKLIST/BOOKS/ITEM/PRICE))"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="zero-or-one(copy-of(/BOOKLIST/BOOKS/ITEM)[TITLE='Pride and Prejudice'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): grounded operand -->
    
    <xsl:template name="r-003" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="zero-or-one(copy-of(/BOOKLIST/BOOKS/ITEM)[TITLE='Pride and Jealousy'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): striding operand - error case -->
    
    <xsl:template name="r-004" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:value-of select="zero-or-one(/BOOKLIST/BOOKS/ITEM/PRICE)"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): striding operand -->
    
    <xsl:template name="r-005" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="zero-or-one(/BOOKLIST/BOOKS/ITEM[@CAT='H'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): striding operand -->
    
    <xsl:template name="r-006" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:copy-of select="zero-or-one(/BOOKLIST/BOOKS/ITEM[@CAT='J'])"/>
        </out>
      </xsl:source-document>
    </xsl:template>
    
    <!-- Streaming zero-or-one(): striding operand - error case, recovered -->
    
    <xsl:template name="r-007" use-when="$RUN">
      <xsl:source-document streamable="yes" href="../docs/books.xml">
        <out>
          <xsl:try>
             <xsl:value-of select="zero-or-one(/BOOKLIST/BOOKS/ITEM/PRICE)"/>
             <xsl:catch errors="*:FORG0003" select="'caught'"/>
          </xsl:try>
        </out>
      </xsl:source-document>
    </xsl:template>    
    

                   
    
</xsl:stylesheet>