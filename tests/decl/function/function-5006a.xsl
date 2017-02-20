<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:sf="http://streamable-functions"
    exclude-result-prefixes="xs sf"
    version="3.0">
    
    <xsl:mode streamable="yes" />
    
    <xsl:template match="/">
        <!-- scanning expression with posture striding -->
        <result>
            <xsl:for-each select="outermost(doc/section//section//p)/text()" >
                <xsl:copy-of select="self::text()" />
            </xsl:for-each>
        </result>
    </xsl:template>
    
    <xsl:function name="sf:deep-descent" streamability="deep-descent" as="node()*">
        <xsl:param name="node" as="node()"/>
        <xsl:sequence select="$node//section//p" />
    </xsl:function>
</xsl:stylesheet>