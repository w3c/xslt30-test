<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

    <!-- current-output-uri() inside anonymous function -->
    
    <xsl:variable name="outUri" select="function() { current-output-uri() }" />    
  
    <xsl:template name="xsl:initial-template">
        <out><xsl:value-of select="$outUri()"/></out>
    </xsl:template>

</xsl:stylesheet>
