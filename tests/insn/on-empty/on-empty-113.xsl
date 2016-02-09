<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- basic tests with xsl:on-empty in combination with other constructs -->
    
    <xsl:output method="text" />
  
    <xsl:template match="/" name="xsl-initial-template">
        <xsl:for-each select="1 to 100">
            <xsl:text expand-text="yes">{ if(. = 1) then 'START-->' else ''}</xsl:text>
            <xsl:sequence select="''" />
            <xsl:value-of select="if(. mod 2) then . else ''" />
            <xsl:sequence select="''" />
            <xsl:sequence select="if(. mod 2) then () else '|'"/>
            <xsl:text expand-text="yes">{''}</xsl:text>
            <xsl:text expand-text="yes">{ if(. = 100) then '&lt;-- END' else ''}</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
