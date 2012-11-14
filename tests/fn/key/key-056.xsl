<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" 
  encoding="UTF-8" indent="yes"/>

<?spec xslt#key?>

  <xsl:key name="primary" match="indexterm" use="primary"/>
  <xsl:key name="primary" match="indexterm" use="primary"/>

  <xsl:template match="/">
  <doc changed="2003-03-06">
  <!-- select every primary keyword only once -->
    <xsl:apply-templates 
     select="//indexterm[count(.|key('primary',primary)[1])= 1]"/>
  </doc>
  </xsl:template>

  <xsl:template match="indexterm">
  <!-- this template should be invoced once for every keyword -->
    <xsl:text>
Test for '</xsl:text>
    <xsl:value-of select="primary"/>
    <xsl:text>' yields </xsl:text>
    <xsl:value-of select="count(key('primary',primary))"/>
    <xsl:text> Entry/ies.</xsl:text>
<!--
    <xsl:for-each select="key('primary',primary)">
    <xsl:value-of select="." />
    </xsl:for-each>
-->
  </xsl:template>
</xsl:stylesheet>
