<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
  exclude-result-prefixes="cat">
  
  <!-- a test that uses version="1.0" must have a dependency on backwards_compatibility -->

<xsl:template match="/">
      <out>
        <xsl:for-each select="/*/cat:test-set/document(@file)/*/cat:test-case">
          <xsl:if test="not((.|..)/cat:dependencies/cat:feature[@value='backwards_compatibility' and not(@satisfied='false')])
                        and cat:test/cat:stylesheet/document(@file)//*[self::xsl:* except self::xsl:output][@version='1.0' and not(@_version)]">
            <backwards><xsl:value-of select="@name"/></backwards>
          </xsl:if>
        </xsl:for-each>  
      </out>
</xsl:template>

</xsl:stylesheet>