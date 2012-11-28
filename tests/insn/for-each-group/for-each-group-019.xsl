<?spec xslt#grouping?>
<xsl:transform version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- nested groups using group-starting-with -->

  <xsl:strip-space elements="*"/>

  <xsl:template match="doc">
    <chapter>
      <xsl:for-each-group select="*" group-starting-with="group1" bind-group="g1">
        <group1>
          <xsl:copy-of select="tag"/>
          <xsl:for-each-group select="$g1" group-starting-with="group2" bind-group="g2">
            <xsl:if test="self::group2">
              <group2>
                <xsl:for-each select="$g2">
                  <xsl:choose>
                    <xsl:when test="self::group2">
                      <xsl:copy-of select="node()"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:copy-of select="."/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </group2>
            </xsl:if>
          </xsl:for-each-group>
        </group1>
      </xsl:for-each-group>
    </chapter>
  </xsl:template>

</xsl:transform>
