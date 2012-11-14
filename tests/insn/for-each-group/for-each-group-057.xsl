<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  
  <!-- in 3.0, current-group is initially absent if a group variable is bound -->
  
<xsl:template match="/">
<err>
	<xsl:for-each-group select="'a', 1 to 10, 'b', 11 to 20" 
	                    group-starting-with="~xs:string"
	                    bind-group="g">
      <xsl:value-of select="count(current-group())"/>
    </xsl:for-each-group>
</err>
</xsl:template>
	
</xsl:transform>