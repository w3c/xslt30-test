<xsl:package
  package-version="1.0.0"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  declared-modes="yes"
  default-mode="a">
  
  <xsl:mode name="a"/>
  <xsl:mode/>  

  <xsl:template match="/">
      <ok/>
  </xsl:template>  
  
  <xsl:template match="/" mode="#unnamed">
    <ok-unnamed/>
  </xsl:template>

</xsl:package>   