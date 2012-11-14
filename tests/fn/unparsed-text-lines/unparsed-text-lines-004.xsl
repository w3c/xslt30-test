<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  
<!-- Test unparsed-text-lines() function (XSLT 2.1) -->
<!-- Read file containing invalid character, recover from the error -->
   <?spec xslt#unparsed-text-lines?>

<xsl:template match="/" name="main">
    <out>
    <xsl:try>
        <xsl:for-each select="unparsed-text-lines('quadruped-contains-NUL.txt', 'iso-8859-1')">
          <line><xsl:value-of select="."/></line>
        </xsl:for-each>
        <xsl:catch errors="*:XTDE1190">
          <error>Invalid text file</error>
        </xsl:catch>
    </xsl:try>
    </out>
</xsl:template>
       
</xsl:stylesheet>