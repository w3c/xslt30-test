<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Use case for group-adjacent to structure a DT/DD style glossary -->
  
  <xsl:template match="/">
    <o><xsl:apply-templates/></o>
  </xsl:template>  
  
<xsl:template match="DL">
  <xsl:variable name="groups">
    <xsl:for-each-group select="*" group-adjacent="name()" bind-group="gp">
      <xsl:choose>
        <xsl:when test="self::DT">
            <DTS><xsl:copy-of select="$gp"/></DTS>
        </xsl:when>      
        <xsl:when test="self::DD">
            <DDS><xsl:copy-of select="$gp"/></DDS>
        </xsl:when>
        <xsl:otherwise/> 
      </xsl:choose>   
    </xsl:for-each-group>
  </xsl:variable>
  <UL>	
    <xsl:for-each-group select="$groups/*" group-starting-with="DTS" bind-group="gp">
      <LI>
        <B>
          <xsl:for-each select="$gp/DT">
            <xsl:value-of select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
          </xsl:for-each>
        </B>
        <xsl:choose>
          <xsl:when test="count($gp/DD) = 1">
            <I><xsl:value-of select="$gp/DD"/></I>  
          </xsl:when>
          <xsl:otherwise>
            <OL>
              <xsl:for-each select="$gp/DD">
                <LI><xsl:value-of select="."/></LI>
              </xsl:for-each>
            </OL>
          </xsl:otherwise>  
        </xsl:choose>
      </LI>
    </xsl:for-each-group>
  </UL>
</xsl:template>
	
</xsl:transform>