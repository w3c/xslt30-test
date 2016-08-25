<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
  
  <!-- streaming, multi-level xsl:for-each-group using group-starting-with -->
  
  <xsl:mode name="s" streamable="yes"/>
    
  <xsl:template name="main">
    <out>
      <xsl:source-document streamable="yes" href="../docs/sections.xml">
        <xsl:for-each-group select="chapter/*" group-starting-with="h1">
          <div>
            <xsl:for-each-group select="current-group()" group-starting-with="h2">
              <div>
                <xsl:for-each-group select="current-group()" group-starting-with="h3">
                  <div>
                    <xsl:copy-of select="current-group()"/>
                  </div>
                </xsl:for-each-group>
              </div>
            </xsl:for-each-group>
          </div>
        </xsl:for-each-group>
      </xsl:source-document>
    </out>
  </xsl:template> 

       
</xsl:transform>

