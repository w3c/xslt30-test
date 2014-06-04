<?xml version="1.0"?> 

<?spec xslt#stylesheet-functions?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:fos="http://www.w3.org/xpath-functions/spec/namespace"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="fos fn math">

  <!-- test that all new functions listed in the F+O specification are implemented (or claim to be available!) in XSLT 2.0 -->
  <!-- This test uses function-catalog.xml as input. This should be updated from time to time
     with the latest version -->

  <xsl:template match="/">
    <xsl:variable name="temp" as="element(f)*">
      <xsl:apply-templates
        select=".//fos:proto[not(../../fos:opermap)][not(../../@prefix=('math', 'map'))]"/>
    </xsl:variable>
    <out>
      <xsl:for-each-group select="$temp, doc('function-1902.out')/out/f" 
         group-by="concat(@name, '|', @arity, '|', @test)">
         <xsl:if test="count(current-group()) ne 2">
           <xsl:copy-of select="current-group()"/>
         </xsl:if>
      </xsl:for-each-group>
    </out>
  </xsl:template>


  <xsl:template match="fos:proto">
    <xsl:variable name="lexname"
      select="if (../../@prefix) then concat(../../@prefix, ':', @name) else @name"/>
    <f name="{$lexname}" arity="{count(fos:arg)}"
      test="{function-available($lexname, count(fos:arg))}"/>
  </xsl:template>
</xsl:stylesheet>
