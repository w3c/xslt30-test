<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

 <?spec xslt#analyze-string?>
  <!-- PURPOSE: regex bug sumbitted by Bob du Charme. -->
  
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
  <o>
  [<xsl:value-of select="matches('AAB', 'A{2}')"/>]
    <xsl:analyze-string select="'AAB'"
                         regex="A{2}">
      <xsl:matching-substring>
         Here it is: <xsl:value-of select="."/>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
          Didn't find it. <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </o>  
  </xsl:template>

</xsl:stylesheet>