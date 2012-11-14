<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 	
	xmlns:out="http://output.ns/">
	
	<!-- TEST namespace-alias - two declarations with different precedence -->
	<?spec xslt#namespace-aliasing?>

    <xsl:import href="xnspc36.xsl"/>
	<xsl:namespace-alias stylesheet-prefix="out" result-prefix="xsl"/>
    <xsl:output method="xml"/>
	<xsl:template match="/">
		<html out:version="2.0"></html>
	</xsl:template>
</xsl:stylesheet>
