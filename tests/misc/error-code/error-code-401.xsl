<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTTE1555?>

  <xsl:import-schema namespace="http://err1555a.com/">
    <xs:schema targetNamespace="http://err1555a.com/">
      <xs:element name="e">
        <xs:complexType>
         <xs:sequence maxOccurs="unbounded">
          <xs:element name="f" form="qualified">
            <xs:complexType>
              <xs:sequence/>
              <xs:attribute name="id" type="xs:ID" use="optional"/>
              <xs:attribute name="idref" type="xs:IDREF" use="optional"/>
            </xs:complexType>
          </xs:element>
         </xs:sequence> 
        </xs:complexType>
      </xs:element>
    </xs:schema>
  </xsl:import-schema>


  <xsl:template name="main">
    <xsl:result-document validation="strict">
      <e xmlns="http://err1555a.com/"><f id="v1"/><f idref="v2"/></e>
    </xsl:result-document>
  </xsl:template>
  




</xsl:stylesheet>