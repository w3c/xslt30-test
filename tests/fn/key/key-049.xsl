<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output indent="yes"/>
<?spec xslt#key?>
<xsl:key name="mykey" match="div" use="title"/>
<xsl:template match="doc">
<out>
      <H1>Test for xsl:key pattern matching.</H1>
      <HR/>
      <P>Should say "template 1->Intro Section.": </P>
      <P><xsl:apply-templates select="key('mykey', 'Introduction')"/></P>
      <HR/>
      <P>Should say "template 2->SS Section.": </P>
      <P><xsl:apply-templates select="key('mykey', 'Stylesheet Structure')/p"/></P>
      <HR/>
      <P>Should say "template 3->Exp Section.": </P>
      <P><xsl:apply-templates select="key('mykey', 'Expressions')/p"/></P>
      <HR/>
      <P>Should say "template 4->Pat Section.": </P>
      <P><xsl:apply-templates select="key('mykey', 'Patterns')/p"/></P>
</out>
</xsl:template>
  
<xsl:template match="key('mykey', 'Introduction')">
    template 1-><xsl:value-of select="p"/>
</xsl:template>
    
<xsl:template match="key('mykey', 'Stylesheet Structure')/p">
    template 2-><xsl:value-of select="."/>
</xsl:template>

<xsl:template match="key('mykey', 'Expressions')/p">
    template 3-><xsl:value-of select="."/>
</xsl:template>

<xsl:template match="key('mykey', 'Patterns')/p">
    template 4-><xsl:value-of select="."/>
</xsl:template>
    
</xsl:stylesheet>