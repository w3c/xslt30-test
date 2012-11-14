<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cat="http://www.w3.org/2005/05/xslt20-test-catalog"
  exclude-result-prefixes="cat">

<xsl:import-schema namespace="http://www.w3.org/2005/05/xslt20-test-catalog"
                   schema-location="../catalog.xsd"/>

<xsl:template match="/">
  <xsl:choose>
    <xsl:when test="* instance of schema-element(cat:testcases)">
      <ok/>
    </xsl:when>
    <xsl:otherwise>
      <not-ok/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>