<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<xsl:template name="main">
  <out>
  <xsl:stream href="../docs/works.xml">
     <xsl:for-each select="remove(snapshot(works/department/employee[1]/empnum/text()), 2)">
        <emp num="{.}" name="{../../@name}" gender="{../../@gender}" dept="{../../../@name}"/>
     </xsl:for-each>
  </xsl:stream>
  </out>
</xsl:template>


</xsl:stylesheet>