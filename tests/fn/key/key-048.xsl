<?xml version="1.0"?> 
<?spec xslt#key?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes"/>

  <xsl:key name="mykey" match="div" use="title"/>

  <xsl:template match="doc">
  <out>
      <H1>Test for xsl:key, and key().</H1>
      <HR/>
      <P>Should say "Intro Section.": </P>
      <P><xsl:value-of select="key('mykey', 'Introduction')/p"/></P>
      <HR/>
      <P>Should say "SS Section.": </P>
      <P><xsl:value-of select="key('mykey', 'Stylesheet Structure')/p"/></P>
      <HR/>
      <P>Should say "Exp Section.": </P>
      <P><xsl:value-of select="key('mykey', 'Expressions')/p"/></P>
  </out>    
  </xsl:template>
    
</xsl:stylesheet>