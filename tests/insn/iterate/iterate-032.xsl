<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

  <!-- xsl:iterate; reference to local variable with xsl:on-completion -->
  <!-- spec unclear, see bug 24179 -->

  <xsl:param name="p" as="element()*" select="()"/>

  <xsl:template name="main">
    <out>
      <xsl:iterate select="$p">
        <xsl:param name="count" select="0"/>
        <xsl:variable name="v" select="$count + number(.)"/>
        <xsl:next-iteration>
          <xsl:with-param name="count" select="$count + 1"/>
        </xsl:next-iteration>
        <xsl:on-completion select="$v"/>
      </xsl:iterate>
    </out>
  </xsl:template>

</xsl:stylesheet>
