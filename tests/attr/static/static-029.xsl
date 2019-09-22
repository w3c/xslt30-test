<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

   <!-- A static variable that is a sequence of attribute nodes-->
   
   <xsl:variable name="keys" select='json-to-xml(&apos;{"a":1, "b":2, "c":3, "d": 4}&apos;)//@key' static="true"/>
   
   <xsl:template name="xsl:initial-template">
      <result count="{count($keys)}" names="{$keys/local-name()}" values="{sort($keys/string())}"/>
   </xsl:template>
   
</xsl:transform>
