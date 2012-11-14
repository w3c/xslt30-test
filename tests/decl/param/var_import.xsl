<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="text()" />

	<xsl:template match="data">
		<xsl:param name="p" select="'123'" />		
		<xsl:value-of select="$p" />
	</xsl:template>	
	
	

</xsl:transform>