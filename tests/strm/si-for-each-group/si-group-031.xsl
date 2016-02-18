<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    version="3.0" 
    exclude-result-prefixes="xs">
    
    <xsl:param name="block-size" as="xs:integer" select="10"/>
    
    <xsl:output indent="yes"/>
    <xsl:mode streamable="yes"/>
    
    <xsl:template match="/*">
        <xsl:variable name="root" as="element()">
            <xsl:copy/>
        </xsl:variable>
        <xsl:for-each-group select="product" group-adjacent="(position() - 1) idiv $block-size">
            <xsl:result-document href="product{current-grouping-key()}.xml">
                <xsl:copy select="$root">
                    <xsl:copy-of select="current-group()"/>
                </xsl:copy>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
    
</xsl:stylesheet>