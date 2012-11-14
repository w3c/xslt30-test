<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE1512?>

  <xsl:import-schema namespace="http://err1515.com/">
    <xs:schema targetNamespace="http://err1515.com/">
      <xs:element name="e" type="xs:date"/>
    </xs:schema>
  </xsl:import-schema>


  <xsl:template name="main">
    
    <out> 
      <xsl:element name="e" namespace="http://err1515.com/" validation="lax">2006-02-31</xsl:element>      
    </out>
  </xsl:template>
  




</xsl:stylesheet>