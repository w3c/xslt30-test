<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:my="http://myfunc.org" 
   version="3.0"
   exclude-result-prefixes="my" >

   <!-- A static variable that is a sequence of different kinds of nodes -->
   
   <xsl:variable name="keys" select="parse-xml('&lt;doc>&lt;?Process fun?>&lt;item attrib=''red''
      xmlns:a=''http://www.a.org''>&lt;!--I am a comment-->hello&lt;/item>&lt;/doc>')//node()" static="true"/>
   
   <xsl:template name="xsl:initial-template">
      <result count="{count($keys)}" kinds="{string-join($keys/my:getNodeKind(.),' ')}">
         <xsl:for-each select="$keys">
            <node name="{local-name()}" value="{string()}" kind="{my:getNodeKind(.)}"/> 
         </xsl:for-each>
      </result>
   </xsl:template>
   
   <xsl:function name="my:getNodeKind" as="text()">
      <xsl:param name="node" as="node()"/>
      <xsl:choose>
         <xsl:when test="$node instance of document-node()">
            <xsl:value-of select="'document-node'"/>
         </xsl:when>
         <xsl:when test="$node instance of element()">
            <xsl:value-of select="'element'"/>
         </xsl:when>
         <xsl:when test="$node instance of attribute()">
            <xsl:value-of select="'attribute'"/>
         </xsl:when>
         <xsl:when test="$node instance of text()">
            <xsl:value-of select="'text'"/>
         </xsl:when>
         <xsl:when test="$node instance of comment()">
            <xsl:value-of select="'comment'"/>
         </xsl:when>
         <xsl:when test="$node instance of processing-instruction()">
            <xsl:value-of select="'processing-instruction'"/>
         </xsl:when>
         <xsl:when test="$node instance of namespace-node()">
            <xsl:value-of select="'namespace-node'"/>
         </xsl:when>
         <xsl:when test="$node instance of node()">
            <xsl:value-of select="'node'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="'unknown'"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
</xsl:transform>
