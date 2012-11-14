<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
>

<!-- test subsequence() (XPath 2.0) -->
<?spec fo#func-subsequence?>

<xsl:output indent="yes"/>
<xsl:template match="/">
  <xsl:variable name="seq" select="(1,2,3,4,5)"/>
  <out>
    <r23><xsl:value-of select="subsequence($seq, 2, 2)" separator=", "/></r23>
    <r12><xsl:value-of select="subsequence($seq, 1, 2)" separator=", "/></r12>
    <r1><xsl:value-of select="subsequence($seq, 0, 2.0e0)" separator=", "/></r1> 
    <r2345><xsl:value-of select="subsequence($seq, 2)" separator=", "/></r2345>     
    <r5><xsl:value-of select="subsequence($seq, 5.0e0)" separator=", "/></r5>
    <r12345><xsl:value-of select="subsequence($seq, 0)" separator=", "/></r12345>
    <r0><xsl:value-of select="subsequence((), 1)" separator=", "/></r0> 


  </out>
</xsl:template>
 
</xsl:stylesheet>
