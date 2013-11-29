<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
  xmlns:err="http://www.w3.org/2005/xqt-errors"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs cat err">
  
  <!-- Test that all non-error stylesheets are valid against the schema for stylesheets -->

  <xsl:import-schema namespace="http://www.w3.org/2012/10/xslt-test-catalog"/>

  <xsl:template match="/">
      <out>
        <xsl:for-each select="/*/cat:test-set/document(@file)//cat:stylesheet[not(ancestor::cat:test-case//cat:error)]/@file">
          <!--<xsl:copy-of select="document(.)" validation="strict"/>-->
          <xsl:try>
            <xsl:message>Validating <xsl:value-of select="."/></xsl:message>
            <xsl:variable name="doc" select="document(.)"/>
            <xsl:choose>
              <xsl:when test="not($doc/xsl:*) or 
                             ($doc//@version/number() > 3) or 
                             ($doc//@use-when) or 
                             ($doc//@Q{http://www.w3.org/2001/XMLSchema-instance}type) or
                             $doc//xs:*[not(ancestor::xsl:import-schema)]">
                 <!-- don't attempt to validate documents rooted at an LRE, or those in forwards compatibility mode, 
                      or using use-when, or using xsi:type, or creating elements in the schema namespace -->
                 <skip file="{.}"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="copy">
            	  <xsl:copy-of select="$doc" validation="strict"/>
                </xsl:variable>
                <ok file="{.}" size="{count($copy//*)}"/>
                </xsl:otherwise>
              </xsl:choose>     
            <xsl:catch>
              <xsl:message select="$err:code, $err:description"> ** Invalid ** </xsl:message>
              <invalid code="{$err:code}" file="{.}" message="{$err:description}"/>
            </xsl:catch>
          </xsl:try>
        </xsl:for-each>  
      </out>
  </xsl:template>

</xsl:stylesheet>