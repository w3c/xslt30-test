<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">
  
  <!-- in 3.0, group adjacent using composite keys -->
  
<xsl:template match="/">
<out>
	<xsl:for-each-group select="/*/city" 
	                    group-adjacent="@country, xs:decimal(@pop)"
	                    composite="yes"
	                    bind-group="g"
	                    bind-grouping-key="k">
	  <group country="{$k[1]}" pop="{$k[2]}">
	    <xsl:copy-of select="$g"/>
	  </group>
	</xsl:for-each-group>
</out>
</xsl:template>
	
</xsl:transform>