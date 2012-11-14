<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Test copying of namespace nodes -->
<!-- REF: XSLT 1.0 Errata -->
  <?spec xslt#copy-of?>

<xsl:template match="/">
<out>
<a1><xsl:copy-of select="//q/namespace::*"/></a1>;
<a2><xsl:copy-of select="//q/namespace::a"/></a2>;
<a3><xsl:for-each select="//namespace::*"><xsl:copy/></xsl:for-each></a3>;
</out>
</xsl:template>
 
</xsl:stylesheet>
