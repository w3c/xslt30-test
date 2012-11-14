<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                >

<!-- PURPOSE: Check the parentage of the namespace nodes for an element -->
<?spec xpath#axes?>

<xsl:output indent="yes"/>
<xsl:template match="/">
<!--<xsl:message>Rewritten for Saxon 7.4.1</xsl:message>-->
<out>
    <xsl:for-each select="//c:chap" xmlns:c="http://chap-default.uri/">
      <xsl:variable name="p" select="."/>
      <xsl:for-each select="namespace::*" >
        <check-parent><xsl:value-of select=".. is $p"/></check-parent>
      </xsl:for-each>  
    </xsl:for-each>
</out>
</xsl:template>
 
</xsl:stylesheet>
