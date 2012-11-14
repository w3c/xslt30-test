<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns="http://www.w3.org/1999/xhtml"
				exclude-result-prefixes="xs" 
				xpath-default-namespace="http://saxon097.uri/">
				
				<!-- test that xsl:evaluate uses xpath-default-namespace -->
				<!-- formerly saxon098 -->
				
	<xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

	<xsl:template match="/">
		<html>
			<head>
				<meta name="Contributor" content="Fred"/>
				<title>test</title>
			</head>
			<body>
				<p><xsl:text>evaluate : </xsl:text> <xsl:evaluate xpath="'/document/data'" 
				                                                  context-item="/"
				                                                  as="xs:string"/></p>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
