<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 	
	xmlns:out="http://output.ns/">
	
	<!-- TEST conflicting xsl:namespace declarations -->
	<?spec xslt#errors?><?error XTSE0810?>

	<xsl:namespace-alias stylesheet-prefix="out" result-prefix="xsl"/>
	<xsl:namespace-alias stylesheet-prefix="out" result-prefix="out"/>	
	<xsl:template match="/">
		<html out:version="1.0"></html>
	</xsl:template>
</xsl:stylesheet>
