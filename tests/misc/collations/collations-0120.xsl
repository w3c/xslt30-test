<!DOCTYPE xsl:stylesheet SYSTEM "collation.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs">

<xsl:strip-space elements="*"/>

<xsl:param name="collation" as="xs:string" select="'&coll;'"/>


<!-- distinct-values() function using explicit collation, default collation, and none -->
<!-- note, results of distinct-values are in undefined order, so we just give the count -->

<xsl:template match="/">
<out>
  <th><xsl:value-of select="count(distinct-values(words/word, $collation))"/></th>
  <th><xsl:value-of select="count(distinct-values(words/word))" default-collation="&coll;"/></th>
  <th><xsl:value-of select="count(distinct-values(words/word))"/></th>  
</out>
</xsl:template>

</xsl:stylesheet>

