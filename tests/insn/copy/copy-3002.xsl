<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- xsl:copy-of copy-accumulators="yes"-->
  
<xsl:template match="/">
  <out>
    <xsl:variable name="v" as="element()">
      <xsl:copy-of select="//*[@x='a3-4']" copy-accumulators="yes"/>
    </xsl:variable>
    <xsl:value-of select="$v/accumulator-before('latest-pick'), 
                          $v/accumulator-after('latest-pick') "/> 
  </out>
</xsl:template>

<xsl:accumulator name="latest-pick" select="()">
  <xsl:accumulator-rule match="a2" new-value="@pick"/>
</xsl:accumulator>  

</xsl:stylesheet>