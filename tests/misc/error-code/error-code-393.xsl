<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTSE1520?>

  <xsl:import-schema namespace="http://err1520a.com/">
    <xs:schema targetNamespace="http://err1520a.com/">
      <xs:element name="e" type="xs:date"/>
    </xs:schema>
  </xsl:import-schema>


  <xsl:template name="main">
    
    <out> 
      <e xsl:type="your:absent-type">2006-02-31</e>      
    </out>
  </xsl:template>
  




</xsl:stylesheet>