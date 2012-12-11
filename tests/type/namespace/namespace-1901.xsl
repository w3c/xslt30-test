<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEST xsl:namespace-alias - stylesheet-prefix="#default" -->

	<xsl:import href="namespace-1002a.xsl"/>

	<xsl:namespace-alias stylesheet-prefix="#default" result-prefix="xsl"/>

	<xsl:template match="/">
		<stylesheet version="1.0">
		 <template name="x">
		  <apply-templates/>
		 </template>
		</stylesheet>
	</xsl:template>
</xsl:stylesheet>
