<?xml version="1.0"?> 

<?spec xslt#number?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="text" indent="yes"/>

<xsl:template match="Family">
  <xsl:for-each select="*">
       <xsl:number
     	value="position()" 
     	format="1.1 "/>
     <!--<xsl:number
		level="multiple"
		count="Parents|gkid|Child"
     	value="position()" 
     	format="1.1 "/>--><xsl:value-of select="."/>        
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>