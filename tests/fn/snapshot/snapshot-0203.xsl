<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="main">
  <out>
  <xsl:stream href="snapshot-02.xml">
     <xsl:for-each select="subsequence(snapshot(works/department/employee/@name), 1, 3)">
        <emp name="{.}" gender="{../@gender}" dept="{../../@name}"/>
     </xsl:for-each>
  </xsl:stream>
  </out>
</xsl:template>


</xsl:stylesheet>