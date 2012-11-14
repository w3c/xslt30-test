<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE0610?>



  <xsl:template name="main">
    <out>
        <xsl:apply-templates>
          
        </xsl:apply-templates>
    </out>
  </xsl:template>
  
  <xsl:template match="doc">
    <xsl:param name="p" as="xs:integer"/>
    <xsl:value-of select="$p"/>
  </xsl:template>   
  


</xsl:stylesheet>