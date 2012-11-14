<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE0812?>



  <xsl:template name="main">
    <my:out>
        <xsl:sequence select="2"/>
    </my:out>
  </xsl:template>
  
<xsl:namespace-alias stylesheet-prefix="my" result-prefix="xs"/>
<xsl:namespace-alias stylesheet-prefix="your" result-prefix="xml"/>


</xsl:stylesheet>