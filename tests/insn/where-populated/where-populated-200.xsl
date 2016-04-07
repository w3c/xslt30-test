<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/" name="xsl-initial-template">
        <xsl:variable name="doc" expand-text="true">{''}</xsl:variable>
        
        <xsl:value-of select="empty($doc/node())" />
    </xsl:template>
    
</xsl:stylesheet>