<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">
  
  <!-- in 3.0, group atomic values using new pattern syntax -->
  
<xsl:template match="/">
<out>
	<xsl:for-each-group select="'a', 1 to 10, 'b', 11 to 20" 
	                    group-starting-with=".[. instance of xs:string]"
	                    bind-group="g">
	  <a><xsl:value-of select="$g"/></a>
    </xsl:for-each-group>
</out>
</xsl:template>
	
</xsl:transform>