<xsl:transform version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="map xs err">

  <xsl:variable name="RUN" select="true()" static="yes"/>
  <xsl:strip-space elements="*"/>


  <!-- within xsl:stream, use xsl:fork/xsl:for-each-group -->

  <xsl:template name="g-001" use-when="$RUN">
    <out>
      <xsl:stream href="../docs/books.xml">
        <xsl:fork>
          <xsl:for-each-group select="/BOOKLIST/BOOKS/ITEM" group-by="@CAT">
            <CAT ID="{current-grouping-key()}">
              <xsl:copy-of select="current-group()"/>
            </CAT>
          </xsl:for-each-group>
        </xsl:fork>
      </xsl:stream>
    </out>
  </xsl:template>

  <!-- within xsl:stream, use xsl:fork/xsl:for-each-group with a grounded population -->

  <xsl:template name="g-002" use-when="$RUN">
    <out>
      <xsl:stream href="../docs/books.xml">
        <xsl:fork>
          <xsl:for-each-group select="/BOOKLIST/BOOKS/ITEM/copy-of()" group-by="@CAT">
            <CAT ID="{current-grouping-key()}">
              <xsl:copy-of select="current-group()"/>
            </CAT>
          </xsl:for-each-group>
        </xsl:fork>
      </xsl:stream>
    </out>
  </xsl:template>



</xsl:transform>
