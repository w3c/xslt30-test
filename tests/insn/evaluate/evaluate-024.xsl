<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:saxon="http://saxon.sf.net/" xmlns:f="f.uri"
  xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="java:java.lang.Math" exclude-result-prefixes="f fn xs math">

  <!--  call position() when context item is undefined within xsl:evaluate -->


  <xsl:param name="e1">true()</xsl:param>
  <xsl:param name="e2">concat('a', 'b')</xsl:param>
  <xsl:param name="e3">fn:position()</xsl:param>
  <xsl:param name="e4">xs:integer('3')</xsl:param>
  <xsl:param name="e5">f:square('5')</xsl:param>
  <xsl:param name="e6">math:max(5,2)</xsl:param>

  <xsl:template match="/">
    <out>
      <a>
        <xsl:evaluate xpath="($e3)"/>
      </a>
    </out>

  </xsl:template>

  <xsl:function name="f:square" as="xs:integer">
    <xsl:param name="x" as="xs:integer"/>
    <xsl:sequence select="$x*$x"/>
  </xsl:function>



</xsl:stylesheet>
