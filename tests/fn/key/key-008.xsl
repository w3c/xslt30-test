<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Purpose: Test for use attribute being first in xsl:key. -->

    <xsl:key use="title" name="mykey" match="div"/>

    <xsl:template match="doc">
        <root>
            <xsl:value-of select="key('mykey', 'Introduction')/p"/>
            <xsl:value-of select="key('mykey', 'Stylesheet Structure')/p"/>
            <xsl:value-of select="key('mykey', 'Expressions')/p"/>
        </root>
    </xsl:template>

</xsl:stylesheet>