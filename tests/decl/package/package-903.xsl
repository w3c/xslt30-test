<!-- missplaced xsl:expose -->
<xsl:package 
  package-version="1.0.0"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.w3.org/xslt30tests/use-package-base-001"
  exclude-result-prefixes="xs p">
  
  <xsl:expose component="template" names="*" visibility="public"/>
    
  <xsl:stylesheet version="3.0">
  
    <xsl:template name="main">
      <ok/>
    </xsl:template>
    
  </xsl:stylesheet>  
  
</xsl:package>   