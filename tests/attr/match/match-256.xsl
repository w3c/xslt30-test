<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:variable name="atomic" select="93"/>
    
    <!-- A match pattern in the form of a variable reference will only match nodes -->
    <xsl:template match="$atomic">
        <wrong/>
    </xsl:template>
    
    <xsl:mode on-no-match="deep-skip"/>
    
    <xsl:template name="xsl:initial-template">
        <out>
            <xsl:apply-templates select="93" />
        </out>
    </xsl:template>
    
</xsl:stylesheet>
