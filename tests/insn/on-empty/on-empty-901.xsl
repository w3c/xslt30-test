<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- basic tests with xsl:on-empty, error w/siblings -->
  
    <xsl:template name="xsl:initial-template">
        <empty>
            <xsl:on-empty select="42"/> 
            <empty>
                <xsl:on-empty select="42"/> 
                <empty>            
                    <xsl:on-empty select="42"/> 
                </empty>
            </empty>
        </empty>
    </xsl:template>

</xsl:stylesheet>
