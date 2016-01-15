<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://example.com/extension-instructions-dont-exist" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:my="http://myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
   <xsl:output indent="yes"/>
   <xsl:template name="xsl:initial-template" expand-text="true" _use-when="{let $f := substring-before#2(?, '-') return $f('true()-now')}">
      <hello>      
         <function >
            {let $f := substring-before#2(?, '-') return $f('true()-now')}
         </function>         
      </hello>
   </xsl:template>
</xsl:transform>
