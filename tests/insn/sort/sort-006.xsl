<?xml version="1.0"?> 

<!-- A test for xsl:sort, including putting duplicates in document order -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  
  <xsl:variable name="expected">
    <affil of="Deach">Adobesystemsnc.</affil>
    <affil of="Grosso">Arbortext</affil>
    <affil of="Caruso">Bitstream</affil>
    <affil of="Cdef">Bubbacorporation</affil>
    <affil of="Efgh">Bubbacorporation</affil>
    <affil of="Abcde">Bubbacorporation</affil>
    <affil of="Defg">Bubbacorporation</affil>
    <affil of="Ghij">Bubbacorporation</affil>
    <affil of="Fghi">Bubbacorporation</affil>
    <affil of="Reynolds">Datalogics</affil>
    <affil of="Kimchi">Enigmainc</affil>
    <affil of="Day">Ibm</affil>
    <affil of="Adler">Insocorporation</affil>
    <affil of="Clark">Invitedexpert</affil>
    <affil of="Boag">Lotusdevelopmentcorporation</affil>
    <affil of="Marsh">Microsoftcorporation</affil>
    <affil of="Ranjan">Netscapecorporation</affil>
    <affil of="Waki">Novell</affil>
    <affil of="Maden">Oreillyassociates</affil>
    <affil of="Moore">Rivcom</affil>
    <affil of="Rand">Silicongraphics</affil>
    <affil of="Dicks">Softquad</affil>
    <affil of="Gutentag">Sunmicrosystems</affil>
    <affil of="Robie">Texcel</affil>
    <affil of="Thompson">Universityofedinburgh</affil>
    <affil of="Milowski">Veosystemsinc.</affil>
    <affil of="Lapp">Webmethods</affil>
    <affil of="Quint">Wwwc</affil>
  </xsl:variable>

  <xsl:template match="w3cgroup">
    <xsl:variable name="actual">
      <xsl:for-each select="member">
        <xsl:sort select="affiliation"/>
        <affil of="{primary/name/last}">
          <xsl:value-of select="affiliation"/>
        </affil>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="deep-equal($actual, $expected)"><ok/></xsl:when>
      <xsl:otherwise><out><xsl:copy-of select="$actual"/></out></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
