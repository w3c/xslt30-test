<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
xmlns:fn="http://www.w3.org/2005/xpath-functions" 
xmlns:fos="http://www.w3.org/xpath-functions/spec/namespace" 
xmlns:map="http://www.w3.org/2005/xpath-functions/map" 
xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="fos math fn map">

<!-- test that all functions listed in the F+O specification are implemented (or claim to be available!) -->
<!-- This test uses function-catalog.xml as input. This should be updated from time to time
     with the latest version -->

  <xsl:template match="/">
    <out>
      <xsl:apply-templates select=".//fos:proto[not(../../fos:opermap)]"/>
    </out>
  </xsl:template>
  
   
  <xsl:template match="fos:proto">
    <xsl:variable name="lexname" select="if (../../@prefix) then concat(../../@prefix, ':', @name) else @name"/>
    <xsl:if test="not(function-available($lexname, count(fos:arg)))">
        <missing-function name="{$lexname}" arity="{count(fos:arg)}"/>
        <xsl:message>*** Missing function name=<xsl:value-of select="$lexname"/> arity=<xsl:value-of select="count(fos:arg)"/></xsl:message>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
