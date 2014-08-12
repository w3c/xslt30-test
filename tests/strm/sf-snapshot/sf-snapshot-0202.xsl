<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="main">
  <out>
  <xsl:stream href="../docs/works.xml">
     <xsl:for-each select="snapshot(works/department/employee)">
        <emp name="{@name}" dept="{../@name}" nr="{empnum}" hours="{hours}"/>
     </xsl:for-each>
  </xsl:stream>
  </out>
</xsl:template>


</xsl:stylesheet>