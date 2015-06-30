<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
  xmlns:err="http://www.w3.org/2005/xqt-errors"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  expand-text="yes"
  exclude-result-prefixes="xs cat err">
  
  <!-- Test that all XSLT element names used in non-error stylesheets satisfy element-available() -->
  
  <xsl:param name="DEBUG" static="yes" select="false()"/>

  <xsl:template match="/">
      <out>
        <xsl:for-each select="/*/cat:test-set/document(@file)//cat:stylesheet[not(ancestor::cat:test-case//cat:error)]/@file">
            <xsl:variable name="doc" select="document(.)"/>
            <xsl:message use-when="$DEBUG">Checking {document-uri($doc)}</xsl:message>
            <xsl:for-each select="$doc//xsl:*
                    [not(ancestor-or-self::xsl:*[number(@version) gt 3])]
                    [not(ancestor-or-self::*[number(@xsl:version) gt 3])]
                    [not(ancestor-or-self::*/@*:use-when)]
                    [not(element-available('xsl:'||local-name(.)))]">
              <unavailable in="{document-uri(/)}">{name()}</unavailable>
            </xsl:for-each>
        </xsl:for-each>  
      </out>
  </xsl:template>

</xsl:stylesheet>