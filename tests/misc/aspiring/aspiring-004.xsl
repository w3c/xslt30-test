<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	exclude-result-prefixes="xs math"
	version="3.0">
	
	<xsl:mode on-no-match="shallow-copy"/>
	
	<xsl:template match="foo">
		<xsl:variable name="serialization1" as="element()">
			<output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
				<output:omit-xml-declaration value="yes"/>
			</output:serialization-parameters>
		</xsl:variable>
		<xsl:comment select="$serialization1"/>
	</xsl:template>
	
</xsl:stylesheet>