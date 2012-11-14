<?xml version="1.0"?> 

<?spec xslt#stylesheet-functions?>
<xsl:stylesheet version="2.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:str="java:java.lang.String"
 xmlns:my="http://ohmy/">
 
 <!-- Test function-available() with two arguments -->
 <?category function-available?>
 
 <xsl:param name="one" select="1"/>
 <xsl:param name="two" select="2"/>
 <xsl:param name="three" select="3"/>  
 
 
  
   <xsl:template match="/">
	<out>
	<a1><xsl:value-of select="function-available('true', 0)"/> should be true</a1>;
	<a1><xsl:value-of select="function-available('translate', $three)"/> should be true</a1>;
    <a1><xsl:value-of select="function-available('function-available', 1)"/> should be true</a1>;
	<a1><xsl:value-of select="function-available('function-available', $two)"/> should be true</a1>;
	<a1><xsl:value-of select="function-available('my:f')"/> should be true</a1>;
	<a1><xsl:value-of select="function-available('my:f', $two)"/> should be true</a1>;
	<a1><xsl:value-of select="function-available('concat', 17)"/> should be true</a1>;		

	<a1><xsl:value-of select="function-available('true', 1)"/> should be false</a1>;
	<a1><xsl:value-of select="function-available('translate', $two)"/> should be false</a1>;
    <a1><xsl:value-of select="function-available('function-available', 3)"/> should be false</a1>;
	<a1><xsl:value-of select="function-available('function-available', $three)"/> should be false</a1>;
	<a1><xsl:value-of select="function-available('my:f', 1)"/> should be false</a1>;
	<a1><xsl:value-of select="function-available('concat', 0)"/> should be false</a1>;		
	</out>
   </xsl:template>
   
   <xsl:function name="my:f">
     <xsl:param name="i"/>
     <xsl:param name="j"/>
     <xsl:value-of select="$i+$j"/>
   </xsl:function>

</xsl:stylesheet>

