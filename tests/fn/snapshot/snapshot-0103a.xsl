<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:f="http://internal.snapshot.com/" 
  expand-text="yes"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 exclude-result-prefixes="f xs">
 
<!-- Test that the results of the fn:snapshot function are equivalent to the 
 (revised) implementation given in the XSLT spec, for parentless nodes of various kinds -->
 
<xsl:variable name="orphans" as="node()*">
  <e/>
  <xsl:attribute name="a" select="1"/>
  <xsl:namespace name="n">http://www.example.com/"</xsl:namespace>
  <xsl:value-of select="0"/>
  <xsl:comment>Fascinating</xsl:comment>
  <xsl:processing-instruction name="go">west young man</xsl:processing-instruction>
</xsl:variable>

<xsl:template match="/">
 <out>
  <xsl:for-each select="$orphans">
    <xsl:if test="not(deep-equal(snapshot(.), f:snapshot(.)) 
                       and deep-equal(snapshot(.)/root(), f:snapshot(.)/root()))"> 
      <wrong node="{generate-id(.)}">
        <actual><xsl:sequence select="snapshot(.)/root()"/></actual>
        <expected><xsl:sequence select="f:snapshot(.)/root()"/></expected>
      </wrong>
    </xsl:if>
  </xsl:for-each>
 </out>
</xsl:template> 
 
<xsl:include href="snapshot-equivalent.xsl"/>


</xsl:stylesheet>