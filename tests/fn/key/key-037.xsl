<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
<!-- test key() in an xsl:for-each-group pattern, with a variable reference in the key() call, 
     and another in the use expression, involves atomization, last step in the pattern -->


<xsl:key name="k1" match="Name" use="../Age[number(.) ge number(../../Age) - $threshold]"/>
<xsl:param name="age"><a>8</a></xsl:param>
<xsl:param name="threshold"><b>30</b></xsl:param>
    
<xsl:template match="/">
<out>
 <xsl:for-each-group select="//Name" group-starting-with="key('k1', $age)">
   <p>
     <xsl:value-of select="current-group()"/>
   </p>
 </xsl:for-each-group>  
</out>
</xsl:template>

</xsl:stylesheet>
