<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="http://f.com/">

    <!-- Purpose: Test that parens are not allowed at the top level of a pattern -->
    <!-- This syntax becomes legal in XSLT 3.0. Moreover, the priority of the pattern
         with parens is higher than the priority without. --> 

<xsl:template match="(doc|cod)">
 <ok/>
</xsl:template>

<xsl:template match="doc">
 <wrong/>
</xsl:template>

<xsl:template match="/">
 <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
