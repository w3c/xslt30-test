<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    version="3.0"
    extension-element-prefixes="xs">

    <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="yes" />
    
    <xsl:template match="doc">
        <!-- Testing fn:available-enironment-variables#0 and fn:available-enironment-variable#1-->
        <?spec fo#func-available-enironment-variables?>
        <?spec fo#func-environment-variable?>
        <x>
            <out>
                <xsl:value-of select="exists(available-environment-variables())" />
            </out>
            <out>
                <xsl:for-each select="available-environment-variables()">
                    <xsl:if test="empty(environment-variable(.))">
                        <xsl:text>false, environment variable '</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>' found, but returns empty-sequence() as result&#xA;</xsl:text> 
                    </xsl:if>
                </xsl:for-each>true</out>
        </x>
    </xsl:template>
</xsl:stylesheet>
