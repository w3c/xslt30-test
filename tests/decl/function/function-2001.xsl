<?xml version="1.0"?> 

<?spec xslt#stylesheet-functions?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<!-- test that all functions listed in the XSLT specification are implemented (or claim to be available!) -->
<!-- This test uses xslt.xml as input. This should be updated from time to time
     with the latest version (modified by removing the DTD reference) -->

  <xsl:template match="/">
    <out>
      <xsl:apply-templates select=".//proto"/>
    </out>
  </xsl:template>
  
   
  <xsl:template match="proto">
    <xsl:variable name="lexname" select="@name"/>
    <xsl:if test="not(function-available($lexname, count(arg)))">
        <missing-function name="{$lexname}" arity="{count(arg)}"/>
        <xsl:message>*** Missing function name=<xsl:value-of select="$lexname"/> arity=<xsl:value-of select="count(arg)"/></xsl:message>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
