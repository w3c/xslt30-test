<?xml version="1.0"?> 

<?spec xslt#stylesheet-functions?><xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:saxon="http://NOT-REALLY.saxon.sf.net/"
 xmlns:sql="http://NOT-REALLY.net.sf.saxon.sql.SQLElementFactory/"
 xmlns:other="http://nowhere.uri/"
 exclude-result-prefixes="saxon sql other">
 
 <!-- Test element-available on a range of names -->
 <!-- Originally a Saxon test in which some of these extensions were available;
      now made interoperable (and somewhat pointless) by changing the namespaces -->
 <?spec xslt#testing-instruction-available?>

   
   <xsl:template match="/">
    <xsl:param name="xsl">xsl:</xsl:param>
	<out>;
	<a1>1. <xsl:value-of select="element-available('xsl:value-of')"/> should be true</a1>;
	<a1>2. <xsl:value-of select="element-available('saxon:assign')"/> should be false</a1>;
	<a1>3. <xsl:value-of select="element-available('sql:connect')"/> should be false</a1>;
	<a1>4. <xsl:value-of select="element-available('xsl:key')"/> should be true</a1>;
	<a1>5. <xsl:value-of select="element-available('xsl:neverHeardOfIt')"/> should be false</a1>;
	<a1>6. <xsl:value-of select="element-available('saxon:collation')"/> should be false</a1>;
	<a1>7. <xsl:value-of select="element-available('other:handler')"/> should be false</a1>;
	<a1>8. <xsl:value-of select="element-available('get-a-life')"/> should be false</a1>;
	<a1>9. <xsl:value-of select="element-available(concat($xsl, 'text'))"/> should be true</a1>;
	</out>
   </xsl:template>

</xsl:stylesheet>

