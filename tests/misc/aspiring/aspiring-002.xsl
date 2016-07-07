<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	exclude-result-prefixes="xs math"
	version="3.0">
	
	<xsl:output indent="yes"/>
    
	<xsl:strip-space elements="*"/>
	
	<xsl:template match="/">
		<xsl:for-each select=".">
			<Root>
			    <copy-all><xsl:copy-of select="copy-of(//Item)"/></copy-all>
				<xsl:for-each-group select="copy-of(//Item)" 
                    group-starting-with="/Item[processing-instruction('start')]">
					<copy-of xsl:use-when="false()">
					    <xsl:copy-of select="current-group()"/>
					</copy-of>
				    <xsl:for-each-group select="current-group() except ." 
                    group-ending-with="Item[processing-instruction('end')]">
						<Group doc="{current-group()[1] instance of document-node()}">
							<xsl:copy-of select="current-group()[position() != last()]"/>
						</Group>
					</xsl:for-each-group>
				</xsl:for-each-group>
			</Root>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
