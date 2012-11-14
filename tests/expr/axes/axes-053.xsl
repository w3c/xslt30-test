<?xml version="1.0"?> 

<?spec xpath#axes?>
  <!-- PURPOSE: Test following axis starting at attribute node. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output indent="yes"/>

  <xsl:template match="/">
    
  
    <out count="{count(//@attx/following::node())}"/>

  </xsl:template>

</xsl:stylesheet>
