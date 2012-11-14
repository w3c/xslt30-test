<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: undefined key in pattern -->
<?spec xslt#errors?><?error XTDE1260?><!-- see bug 809 -->


  
  <xsl:template match="item">
    <out>
      <xsl:number level="any" count="key('nokey', 12)/item"/>
      <xsl:message>Error not detected!</xsl:message>
    </out>
  </xsl:template>
  

</xsl:stylesheet>