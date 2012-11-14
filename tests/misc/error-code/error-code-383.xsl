<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1480?>


  <xsl:template name="main">
    
    <out> 
      <xsl:copy-of select="my:f()"/>
    </out>
  </xsl:template>
  
  <xsl:function name="my:f">
          <xsl:result-document href="temp.out">
               <apple/>
          </xsl:result-document>    
  </xsl:function>
  



</xsl:stylesheet>