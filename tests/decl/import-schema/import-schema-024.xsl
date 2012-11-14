<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:hat="http://hats.uri/"
        exclude-result-prefixes="xs hat">

<!-- PURPOSE: Test "cast as" and "instance of" with user-defined atomic types. -->
              <?spec xslt#import-schema?>
              <?spec xpath#id-cast?>
              <?spec xpath#id-instance-of?>
  
<xsl:import-schema namespace="http://hats.uri/" schema-location="schema030.xsd"/>
<xsl:output indent="yes"/>

  <xsl:template match="/">
    <out>
      <hatsize>
      <t><xsl:value-of select="('abc123' cast as hat:vreg) instance of hat:vreg"/></t> 
      <t><xsl:value-of select="('abc123' cast as hat:vreg?) instance of xs:string"/></t> 
      <t><xsl:value-of select="('abc123' cast as hat:vreg) instance of item()+"/></t> 
      <f><xsl:value-of select="('abc123' cast as hat:vreg) instance of xs:integer+"/></f> 
      <f><xsl:value-of select="('abc123' cast as hat:vreg) instance of hat:hatsize+"/></f> 
      </hatsize>               
    </out>
  </xsl:template>
  
</xsl:stylesheet>