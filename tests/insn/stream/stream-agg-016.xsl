<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Test of xsl:stream with sum of a computed value -->
    
    <xsl:template name="main">
      <xsl:stream href="big-transactions.xml">
        <out>
          <xsl:value-of select="xs:integer(round(sum(account/transaction/(@value*2))))"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
</xsl:stylesheet>