<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Use group-adjacent to merge a set of adjacent bullets under an envelope element -->
  
  <xsl:template match="/">
    <o><xsl:apply-templates/></o>
  </xsl:template>  
  
<xsl:template match="p">
    <xsl:for-each-group select="node()" 
            group-adjacent="self::ul or self::ol"
            bind-group="gp">
        <xsl:choose>
            <xsl:when test="self::ul or self::ol">
                <xsl:copy-of select="$gp"/>  
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:copy-of select="$gp"/>
                </p>
            </xsl:otherwise>  
        </xsl:choose>
    </xsl:for-each-group>
</xsl:template>    
	
</xsl:transform>