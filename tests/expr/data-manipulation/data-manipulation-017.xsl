<?xml version="1.0"?> 

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<?spec xslt#format-number?>
  <!-- Purpose: Test of "format-number" using a variable as 
       the number to be formatted and a variable for the
       format pattern. -->

<xsl:variable name = "variable1">1234.78</xsl:variable>
<xsl:variable name = "variable2">#,###.00</xsl:variable>

<xsl:template match="doc">
 <out>
   <xsl:value-of select = "format-number($variable1,$variable2)"/>
 </out>
</xsl:template>

</xsl:stylesheet>
