<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="xs">


  <!-- PURPOSE: test use-when="available-environment-variables()". -->

  <xsl:variable name="user" select="environment-variable('USER')"/>
  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="para" use-when="exists(available-environment-variables())">
    <p ok="string-length($user) ge 0">
      <xsl:next-match/>
    </p>
  </xsl:template>

</xsl:stylesheet>
