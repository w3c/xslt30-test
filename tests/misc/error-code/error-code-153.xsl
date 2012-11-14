<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="0.5">

  <!-- PURPOSE: Test validation when version is lower than supported version. -->
  <!-- This stylesheet should flag an error. -->
  <?spec xslt#errors?><?error XTSE0010?>
  
  <xsl:template match="/">
    <out>
      <xsl:choose>
        <xsl:when test="number(system-property('xsl:version')) >= 0.5">
          <xsl:exciting-new-8.5-feature/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>This stylesheet requires XSLT 0.5 or higher</xsl:message>
        </xsl:otherwise>
      </xsl:choose>
    </out>
  </xsl:template>
   
</xsl:stylesheet>
