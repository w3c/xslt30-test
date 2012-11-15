<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

        <!-- TEST node-name() function (returning a QName) -->

        <xsl:template match="e">
                <z>
                        <xsl:for-each select="child::node() | @*">
                                <n namespace="{namespace-uri-from-QName(node-name(.))}"
                                        local-name="{local-name-from-QName(node-name(.))}"/>
                        </xsl:for-each>
                </z>
        </xsl:template>

</xsl:stylesheet>
