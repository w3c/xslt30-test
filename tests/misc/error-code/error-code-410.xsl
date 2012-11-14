<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               exclude-result-prefixes="xs"
>
  <!-- Generate a data file with $records elements -->

  <xsl:param name="records" as="xs:integer"/>

  <xsl:template name="initial">
    <xsl:result-document href="{$records}.xml">
      <booklist>
        <xsl:for-each select="(1 to $records)" >
          <book author="Frank Herbert030" title="Dune"/>
        </xsl:for-each>
      </booklist>
    </xsl:result-document>
  </xsl:template>
</xsl:transform>