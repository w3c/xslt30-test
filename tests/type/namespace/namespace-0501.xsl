<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Test of namespace stuff.  -->
  <?spec fo#func-name?>
  <?spec fo#func-local-name?>
  <?spec fo#func-namespace-uri?>  
<xsl:template match="/*">
  <out>
  <xsl:for-each select="@*|*">
	name(.):      		<xsl:value-of select="name(.)"/>
	local-name(.): 		<xsl:value-of select="local-name(.)"/>
	<!-- prefix:        <xsl:value-of select="substring-before( name(.), ':' )"/> -->
	namespace-uri(.):  	<xsl:value-of select="namespace-uri(.)"/>  
  </xsl:for-each>
  <xsl:apply-templates/>
  </out>

</xsl:template>

<xsl:template match="*">
  <xsl:for-each select="@*|*">
	name(.):      		<xsl:value-of select="name(.)"/>
	local-name(.): 		<xsl:value-of select="local-name(.)"/>
	<!-- prefix:        <xsl:value-of select="substring-before( name(.), ':' )"/> -->
	namespace-uri(.):  	<xsl:value-of select="namespace-uri(.)"/>  
  </xsl:for-each>
  <xsl:apply-templates/>
</xsl:template>


</xsl:stylesheet>
