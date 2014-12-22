<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:f="http://lre-019.com/" exclude-result-prefixes="f">

<?spec xslt#lre-namespaces?>

    <!-- Purpose: Test use of xsl:on-empty on a LRE. -->
  <!-- Elaboration: Some simple cases where on-empty fires or does not fire -->
  
<xsl:param name="zls" select="''"/>  

<xsl:template match="/">
  <out>
    <a><xsl:conditional-content><lre>12</lre></xsl:conditional-content></a>
    <b><xsl:conditional-content><lre><x/></lre></xsl:conditional-content></b>
    <c><xsl:conditional-content><lre><!--heh--></lre></xsl:conditional-content></c>
    <d><xsl:conditional-content><lre><?pi?></lre></xsl:conditional-content></d>
    <e><xsl:conditional-content><lre><xsl:attribute name="x">12</xsl:attribute></lre></xsl:conditional-content></e>
    <f><xsl:conditional-content><lre x="12"/></xsl:conditional-content></f>
    <g><xsl:conditional-content><lre><xsl:attribute name="x" select="'abc'"/></lre></xsl:conditional-content></g>
    
    <p><xsl:conditional-content><lre/></xsl:conditional-content></p>
    <q><xsl:conditional-content><lre></lre></xsl:conditional-content></q>
    <r><xsl:conditional-content><lre><xsl:value-of select="$zls"/></lre></xsl:conditional-content></r>
    <s><xsl:conditional-content><lre xmlns:p="http://p.com/"></lre></xsl:conditional-content></s>
  </out>
</xsl:template>

<xsl:function name="f:att">
  <xsl:attribute name="x" select="'abc'"/>
</xsl:function>

</xsl:stylesheet>