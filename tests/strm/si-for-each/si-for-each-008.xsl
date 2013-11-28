<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within xsl:stream, use parent axis within xsl:for-each -->
   
  <xsl:template name="main">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[position() lt 5]">
          <xsl:sequence select="name(..)"/>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template> 

       
</xsl:transform>

