<!DOCTYPE xsl:stylesheet SYSTEM "collation.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs">

<xsl:strip-space elements="*"/>

<xsl:param name="collation" as="xs:string" select="'&coll;'"/>


<!-- compare() function using default collation to compare two equal words -->

<xsl:template match="/" default-collation="&coll;">
<out>
  <eq><xsl:value-of select="compare(words/word[3], words/word[10])"/></eq>
</out>
</xsl:template>

</xsl:stylesheet>

