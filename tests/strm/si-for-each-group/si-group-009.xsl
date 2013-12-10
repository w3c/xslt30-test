<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
  
  <!-- streaming, xsl:for-each-group group-adjacent, classic "adjacent bullets" use case -->
  
  <xsl:mode name="s" streamable="yes"/>
    
  <xsl:template name="main">
    <out>
      <xsl:stream href="../docs/bullets.xml">
        <xsl:for-each-group select="chapter/*" group-adjacent="node-name()" bind-group="g" bind-grouping-key="k">
          <xsl:choose>
            <xsl:when test="self::bullet">
              <list>
                <xsl:apply-templates select="$g" mode="s"/>
              </list>
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy-of select="$g"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each-group>
      </xsl:stream>
    </out>  
  </xsl:template> 


  <xsl:template match="bullet" mode="s">
    <li><xsl:value-of select="."/></li>
  </xsl:template>   
  

       
</xsl:transform>

