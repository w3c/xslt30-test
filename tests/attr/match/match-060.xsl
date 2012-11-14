<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<?spec xslt#patterns?>
    <!-- Purpose: Union pattern allowing node test or atomic value. -->
  <!-- Update 2012-09-12: no longer meaningful according to the latest spec -->

<xsl:template match="/">
 <out>
 	<xsl:apply-templates/>
 	<xsl:apply-templates select="28"/>
 </out>
</xsl:template>

<xsl:template match="~element(doc)">
  <doc2><xsl:apply-templates/></doc2>
</xsl:template>

<xsl:template match="~element(foo) | ~xs:integer">
  <foo2/>
</xsl:template>


</xsl:stylesheet>
