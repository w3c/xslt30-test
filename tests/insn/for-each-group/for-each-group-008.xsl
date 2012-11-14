<?spec xslt#grouping?>
<html xsl:version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- test value-based grouping with explicit use of the codepoint collation -->
  <body>
    <xsl:for-each-group select="cities/city" group-by="substring(@name,1,1)"
                        collation="http://www.w3.org/2005/xpath-functions/collation/codepoint"
                        bind-group="g1" bind-grouping-key="gk">
      <xsl:sort select="$gk"/>
      <h2>
        <xsl:value-of select="upper-case($gk)"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="count($g1)"/>
        <xsl:text>)</xsl:text>
      </h2>
      <xsl:for-each select="$g1">
        <p><xsl:value-of select="@name"/></p>
      </xsl:for-each>
    </xsl:for-each-group>
  </body>
</html>