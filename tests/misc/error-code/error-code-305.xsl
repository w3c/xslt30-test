<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE0950?>

<xsl:import-schema namespace="http://err0950a.com/">
  <xs:schema targetNamespace="http://err0950a.com/">
    <xs:element name="e">
      <xs:complexType>
        <xs:sequence/>
        <xs:attribute name="q1" type="xs:QName"/>
      </xs:complexType>
    </xs:element>
  </xs:schema>
</xsl:import-schema>

<xsl:param name="p" select="''"/>

  <xsl:template name="main" xmlns="http://err0950a.com/">
    <xsl:variable name="x" as="element()">
      <e q1="my:value" xsl:validation="strict"/>
    </xsl:variable>
    <out>
        <xsl:copy-of select="$x/@q1" validation="preserve"/>
    </out>
  </xsl:template>
  



</xsl:stylesheet>