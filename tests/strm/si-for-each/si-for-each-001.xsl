<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within xsl:stream, use xsl:for-each -->
   
  <xsl:template name="main">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[@value &lt; 0]">
          <xsl:copy-of select="."/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template> 

       
</xsl:transform>

