<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- Test of xsl:stream with empty() and a boolean filter -->
    
    <xsl:template name="main">
      <xsl:stream href="big-transactions.xml">
        <out>
          <xsl:value-of select="empty(account/transaction[@value &gt; 10000000])"/>
        </out>
      </xsl:stream>
    </xsl:template>   
    
</xsl:stylesheet>