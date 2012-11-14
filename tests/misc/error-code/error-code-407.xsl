<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE1590?>

<xsl:character-map name="one" use-character-maps="two">
  <xsl:output-character character="a" string="aa"/>
</xsl:character-map>

<xsl:character-map name="three">
  <xsl:output-character character="b" string="bb"/>
</xsl:character-map>


  <xsl:template name="main">
   <out>
     <e/>
   </out>
  </xsl:template>
  




</xsl:stylesheet>