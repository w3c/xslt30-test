<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="no"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        
        <results>
            <xsl:merge>
                <xsl:merge-source select="doc('school1.xml')/school/class[@id='c1']/pupil">
                        <xsl:merge-key select="number(tests/test[@id='test1']/mark)" order="descending"/>
                        <xsl:merge-key select="surname"/>
                        <xsl:merge-key select="firstname"/>
                </xsl:merge-source>
                <xsl:merge-source select="doc('school1.xml')/school/class[@id='c2']/pupil">
                        <xsl:merge-key select="number(tests/test[@id='test1']/mark)" order="descending"/>
                        <xsl:merge-key select="surname"/>
                        <xsl:merge-key select="firstname"/>
                </xsl:merge-source>
                <xsl:merge-source select="doc('school2.xml')/school/class[@id='c1']/pupil">
                        <xsl:merge-key select="number(tests/test[@id='test1']/mark)" order="descending"/>
                        <xsl:merge-key select="surname"/>
                        <xsl:merge-key select="firstname"/>
                </xsl:merge-source>
                <xsl:merge-action><xsl:copy-of select="current-merge-group()"/></xsl:merge-action>
            </xsl:merge>
        </results>
        
    </xsl:template>
</xsl:stylesheet>