<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

<?error XTDE0485?>

<!-- this test was designed to produce error 0485, but it doesn't.
     See W3C bugzilla 3069 --> 

<xsl:import-schema namespace="http://err0485.com/">
  <xs:schema targetNamespace="http://err0485.com/">
    <xs:element name="out">
      <xs:complexType>
        <xs:sequence/>
        <xs:attribute name="q1" type="xs:QName"/>
        <xs:attribute name="q2" type="xs:QName"/>
      </xs:complexType>
    </xs:element>
  </xs:schema>
</xsl:import-schema>  



  <xsl:template name="main">
    <out xsl:validation="strict" xmlns="http://err0485.com/">
       <xsl:attribute name="q1" xmlns:a="http://one.uri/">a:one</xsl:attribute>
       <xsl:attribute name="q2" xmlns:a="http://two.uri/">a:two</xsl:attribute>
    </out>
  </xsl:template>
  


</xsl:stylesheet>