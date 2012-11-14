<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0710?>



  <xsl:template match="/">
    <out>
        <xsl:apply-templates/>
        <xsl:element name="e" use-attribute-sets="z"/>
    </out>
  </xsl:template>
  



</xsl:stylesheet>