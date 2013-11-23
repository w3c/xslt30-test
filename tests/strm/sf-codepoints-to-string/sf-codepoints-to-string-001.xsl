<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://local.functions/"
    exclude-result-prefixes="map xs f">
    
    <!-- Test of xsl:stream calling codepoints-to-string()  -->
    
    <xsl:template name="main">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="codepoints-to-string(//TITLE/(30+string-length(.)))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    
</xsl:stylesheet>