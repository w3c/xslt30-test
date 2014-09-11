<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:f="http://lre-019.com/" exclude-result-prefixes="f">

<?spec xslt#lre-namespaces?>

    <!-- Purpose: Test use of xsl:on-empty on a LRE. -->
  <!-- Elaboration: Some simple cases where on-empty fires or does not fire -->
  
<xsl:param name="zls" select="''"/>  

<xsl:template match="/">
  <out>
    <a><lre xsl:on-empty="()">12</lre></a>
    <b><lre xsl:on-empty="()"><x/></lre></b>
    <c><lre xsl:on-empty="()"><!--heh--></lre></c>
    <d><lre xsl:on-empty="()"><?pi?></lre></d>
    <e><lre xsl:on-empty="()"><xsl:attribute name="x">12</xsl:attribute></lre></e>
    <f><lre xsl:on-empty="()" x="12"/></f>
    <g><lre xsl:on-empty="()"><xsl:attribute name="x" select="'abc'"/></lre></g>
    
    <p><lre xsl:on-empty="()"/></p>
    <q><lre xsl:on-empty="()"></lre></q>
    <r><lre xsl:on-empty="()"><xsl:value-of select="$zls"/></lre></r>
    <s><lre xsl:on-empty="()" xmlns:p="http://p.com/"></lre></s>
  </out>
</xsl:template>

<xsl:function name="f:att">
  <xsl:attribute name="x" select="'abc'"/>
</xsl:function>

</xsl:stylesheet>