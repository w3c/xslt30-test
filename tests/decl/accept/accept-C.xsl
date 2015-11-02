<!-- base stylesheet for testing variations of xsl:accept -->

<xsl:package id="accept-C" name="http://www.w3.org/xslt30tests/accept-C" package-version="1.0.0"
  version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:C="http://www.w3.org/xslt30/tests/accept"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  exclude-result-prefixes="xs C">


  <xsl:variable name="v1" as="xs:integer" visibility="abstract"/>

  <xsl:template name="t1" as="xs:integer" visibility="abstract">
    <xsl:param name="p1" as="xs:string"/>
  </xsl:template>

  <xsl:attribute-set name="a1" visibility="abstract"/>

  <xsl:function name="C:f1" as="xs:integer" visibility="abstract">
    <xsl:param name="p1" as="xs:string"/>
  </xsl:function>


</xsl:package>
