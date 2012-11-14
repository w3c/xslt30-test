<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- test a key with a numeric type -->
<?spec xslt#keys?>
<xsl:key name="k" match="b" use="string-length(.)"/>

<xsl:output indent="yes"/>

  <xsl:template match="/">
    <out>
     <one><xsl:copy-of select="key('k', 4)"/></one>
     <two><xsl:copy-of select="key('k', '4')"/></two>     
    </out>
  </xsl:template>
 
</xsl:stylesheet>
