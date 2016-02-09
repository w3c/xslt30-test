<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="foo" as="text()">
        <!-- multiple empty text nodes are removed -->
        <xsl:text expand-text="yes">{ (:hello:) 'empty'[false()]}</xsl:text>
        <xsl:text/>
        <xsl:text expand-text="yes">{ (:hello:) 'empty'[false()]}</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/" name="xsl:initial-template">
        <result><xsl:copy-of select="$foo" /></result>
    </xsl:template>
    
</xsl:stylesheet>