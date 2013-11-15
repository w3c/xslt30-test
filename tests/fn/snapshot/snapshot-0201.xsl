<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="main">
  <out>
  <xsl:stream href="snapshot-02.xml">
     <xsl:for-each select="works/department/employee/snapshot(.)">
        <emp name="{@name}" dept="{../@name}" nr="{num}" hours="{hours}"/>
     </xsl:for-each>
  </xsl:stream>
  </out>
</xsl:template>


</xsl:stylesheet>