<?spec xslt#grouping?>
<xsl:transform 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">
  
  <!-- in 3.0, group adjacent using variable-length composite keys -->
  
<xsl:template match="/">
<out>
	<xsl:for-each-group select="//*" 
	                    group-adjacent="ancestor-or-self::*/name()"
	                    composite="yes"
	                    bind-group="g"
	                    bind-grouping-key="k">
	  <element path="{string-join($k, '/')}" count="{count($g)}"/>
	</xsl:for-each-group>
</out>
</xsl:template>
	
</xsl:transform>