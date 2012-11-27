<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:import href="attribute-set-2201a.xsl"/>
    <xsl:import href="attribute-set-2201b.xsl"/>

    <!-- Purpose: Basic test of import precedence with attribute sets -->


    <xsl:template match="/">
        <out>
            <foo xsl:use-attribute-sets="bar"/>
        </out>
    </xsl:template>

</xsl:stylesheet>
