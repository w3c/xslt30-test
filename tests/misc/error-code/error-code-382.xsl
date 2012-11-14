<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1480?>

  <xsl:param name="p" select="'your:qname'"/>

  <xsl:template name="main">
    
    <out> 
      <xsl:variable name="t">       
          <xsl:result-document href="temp.out">
               <apple/>
          </xsl:result-document>
      </xsl:variable>
      <xsl:copy-of select="$t"/>
    </out>
  </xsl:template>
  



</xsl:stylesheet>