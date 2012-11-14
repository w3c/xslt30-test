<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:sx="http://saxon.sf.net/"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns="http://www.w3.org/1999/xhtml"
				exclude-result-prefixes="sx xs" extension-element-prefixes="sx">
				
				<!-- test that xsl:evaluate does use the default namespace from the source document -->
				<!-- formerly saxon097 -->
	<xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

	<xsl:template match="/">
		<html>
			<head>
				<meta name="Contributor" content="Fred"/>
				<title>test</title>
			</head>
			<body xmlns:d="http://saxon097.uri/">
				<p><xsl:text>evaluate-node : </xsl:text>
				   <xsl:variable name="path" select="/d:document/d:path"/>
				   <xsl:for-each select="$path"> 
				     <xsl:evaluate xpath="string($path)"
				                   context-item="."
				                   base-uri="base-uri($path)"
				                   namespace-context="$path"
				                   as="xs:string"/>
				   </xsl:for-each>
				   </p>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
