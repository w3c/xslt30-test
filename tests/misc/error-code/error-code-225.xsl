<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<?error XTSE0220?>

  <xsl:import-schema namespace="http://www.err0220.com/">
    <xs:schema targetNamespace="http://www.err0220.com/" 
               xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:element name="temp"/>
      <xs:element name="temp"/>
    </xs:schema>
  </xsl:import-schema>

  <xsl:template name="main">
    <out>
      <xsl:apply-templates/>
    </out>
  </xsl:template>




</xsl:stylesheet>