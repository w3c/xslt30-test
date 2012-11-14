<?xml version="1.0"?> 

<!-- test case for bug
     https://sourceforge.net/tracker/index.php?func=detail&aid=553347&group_id=29872&atid=397617
     (Context not reset on return from a call to a stylesheet function) -->

<?spec xslt#stylesheet-functions?>
<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xmi="http://ccfit.nsu.ru/gusarov"> 

<xsl:strip-space elements="*"/> 
<xsl:template match="text()|@*"/> 

<xsl:variable name="actors" select="//Actor"/> 

<xsl:function name="xmi:name"> 
  <xsl:param name="this"/> 
  <xsl:message>xmi:name</xsl:message>
  <xsl:sequence select="$this/name"/> 
</xsl:function> 

<xsl:function name="xmi:get_links_to_parents"> 
  <xsl:param name="this"/>
  <xsl:sequence select="$this/generalization/Gen/@xmi.idref"/> 
</xsl:function> 

<xsl:function name="xmi:get_links_to_children"> 
  <xsl:param name="this"/> 
  <xsl:sequence select="$this/specialization/Gen/@xmi.idref"/> 
</xsl:function> 

<xsl:template match="/"> 
<html> 
<head/> 
<body> 

<p/><h2>When we use functions and variables:</h2><p/> 

<xsl:for-each select="$actors"> 
Actor: <xsl:value-of select="name"/> 
<p/>Children:<xsl:for-each select="$actors[xmi:get_links_to_parents(.) = xmi:get_links_to_children(current())]"> 
<xsl:value-of select="name"/><p/> 
</xsl:for-each>
<p/>Parents:<xsl:for-each select="$actors[xmi:get_links_to_children(.) = xmi:get_links_to_parents(current())]"> 
<xsl:value-of select="name"/><p/> 
</xsl:for-each> 

<hr/> 
</xsl:for-each> 

<p/><h2>When we do not use functions:</h2><p/> 

<xsl:for-each select="$actors"> 
Actor: <xsl:value-of select="name"/> 

<p/>Children:<xsl:for-each select="$actors[./generalization/Gen/@xmi.idref = current()/specialization/Gen/@xmi.idref]"> 
<xsl:value-of select="name"/><p/> 
</xsl:for-each> 

<p/>Parents:<xsl:for-each select="$actors[current()/generalization/Gen/@xmi.idref = ./specialization/Gen/@xmi.idref]"> 
<xsl:value-of select="name"/><p/> 
</xsl:for-each> 

<hr/> 
</xsl:for-each> 

<p/><h2>When we do not use variables:</h2><p/> 

<xsl:for-each select="//Actor"> 
Actor: <xsl:value-of select="name"/> 

<p/>Children:<xsl:for-each select="//Actor[xmi:get_links_to_parents(.) = xmi:get_links_to_children(current())]"> 
<xsl:value-of select="name"/><p/> 
</xsl:for-each> 

<p/>Parents:<xsl:for-each select="//Actor[xmi:get_links_to_children(.) = xmi:get_links_to_parents(current())]">
<xsl:value-of select="name"/><p/> 
</xsl:for-each> 

<hr/> 
</xsl:for-each> 

</body> 
</html> 
</xsl:template> 


</xsl:stylesheet> 

