<?xml version="1.0"?> 

<!-- A test for xsl:sort, including putting duplicates in document order -->
<?spec xslt#sorting?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes"/>
  <xsl:template match="w3cgroup">
    <out changed="2001-11-21">
      <xsl:for-each select="member">
        <xsl:sort select="affiliation"/>
        <affil of="{primary/name/last}">
        <xsl:value-of select="affiliation"/>
        </affil>
      </xsl:for-each>
    </out>
  </xsl:template>

</xsl:stylesheet>