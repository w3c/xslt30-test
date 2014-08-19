<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    
    <xsl:import-schema schema-location="books.xsd"/>
    
    <!-- Validation = strict -->
    
    <xsl:template name="s-101" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" validation="strict">
          <xsl:value-of select="//PRICE instance of element(*, xs:decimal)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Validation = strict, invalid -->
    
    <xsl:template name="s-102" use-when="$RUN">
      <out>
        <xsl:stream href="books-invalid.xml" validation="strict">
          <xsl:value-of select="//PRICE instance of element(*, xs:decimal)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Validation by type, valid -->
    
    <xsl:template name="s-103" use-when="$RUN">
      <out>
        <xsl:stream href="books.xml" type="BOOKLIST-type">
          <xsl:value-of select="//PRICE instance of element(*, xs:decimal)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Validation by type, invalid -->
    
    <xsl:template name="s-104" use-when="$RUN">
      <out>
        <xsl:stream href="books-invalid.xml" type="BOOKLIST-type">
          <xsl:value-of select="//PRICE instance of element(*, xs:decimal)+"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Partial validation, valid -->
    
    <xsl:template name="s-105" use-when="$RUN">
      <out>
        <xsl:stream href="books-invalid.xml">
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1]" validation="strict"/>
        </xsl:stream>
      </out>
    </xsl:template>
    
    <!-- Partial validation, invalid -->
    
    <xsl:template name="s-106" use-when="$RUN">
      <out>
        <xsl:stream href="books-invalid.xml">
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[2]" validation="strict"/>
        </xsl:stream>
      </out>
    </xsl:template>
    


              
    
</xsl:stylesheet>