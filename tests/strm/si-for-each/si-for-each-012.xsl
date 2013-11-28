<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within xsl:stream, iterate over ancestor axis within xsl:for-each/@select -->
   
  <xsl:template name="main">
    <out xmlns="http://loan.shark.com/">
      <xsl:stream href="../docs/loans.xml">
        <xsl:for-each select="outermost(//*:extra)">
          <xsl:for-each select="ancestor::*">
            <xsl:copy>
              <xsl:copy-of select="@*"/>
            </xsl:copy>
          </xsl:for-each>  
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template>

       
</xsl:transform>

