<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
   xpath-default-namespace="urn:FOO" version="3.0" xmlns="urn:FOO">
   <xsl:template match="a">
      <A>
         <xsl:apply-templates/>
      </A>
   </xsl:template>
</xsl:stylesheet>