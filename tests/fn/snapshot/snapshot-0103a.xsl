<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
 xmlns:f="http://example.com/functions" 
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 exclude-result-prefixes="f xs">
 
<!-- Test that the results of the fn:snapshot function are equivalent to the 
 (revised) implementation given in the XSLT spec, for parentless nodes of various kinds -->
 
<xsl:variable name="orphans" as="node()*">
  <e/>
  <xsl:attribute name="a" select="1"/>
  <xsl:namespace name="n">http://www.example.com/"</xsl:namespace>
  <xsl:value-of select="0"/>
  <xsl:comment>Fascinating</xsl:comment>
  <xsl:processing-instruction name="go">west young man</xsl:processing-instruction>
</xsl:variable>

<xsl:template match="/">
 <out>
  <xsl:for-each select="$orphans">
    <xsl:if test="not(deep-equal(snapshot(.), f:snapshot(.)) 
                       and deep-equal(snapshot(.)/root(), f:snapshot(.)/root()))"> 
      <wrong node="{generate-id(.)}">
        <actual><xsl:sequence select="snapshot(.)/root()"/></actual>
        <expected><xsl:sequence select="f:snapshot(.)/root()"/></expected>
      </wrong>
    </xsl:if>
  </xsl:for-each>
 </out>
</xsl:template> 
 


<!-- Following functions are the implementation of fn:snapshot defined in the XSLT 3.0 spec -->

  <xsl:function name="f:snapshot" as="item()*">
    <xsl:param name="input" as="item()*"/>
    <xsl:apply-templates select="$input" mode="snapshot"/>
  </xsl:function>
  
  <!-- for atomic values and function items, return the item unchanged -->
  
  <xsl:template match="." mode="snapshot">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <!-- for a parentless node, return a deep copy -->
  
  <xsl:template match="(/ | node() | @* | namespace-node())[not(..)]" mode="snapshot">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <!-- for an element with a parent, graft it to a copy of its parent;
         then return the only child element of this copied parent. -->
  
  <xsl:template match="*[..]" mode="snapshot" as="element()">
    <xsl:sequence select="f:graft-to-parent(.)/*"/>
  </xsl:template>
  
  <!-- for an attribute with a parent, graft it to a copy of its parent;
         then return the corresponding attribute this copied parent. -->
  
  <xsl:template match="@*[..]" mode="snapshot" as="attribute()">
    <xsl:sequence select="f:graft-to-parent(.)/@*[node-name(.) = node-name(current())]"/>
  </xsl:template>
  
  <!-- for a namespace node with a parent, graft it to a copy of its parent;
         then return the corresponding namespace node of this copied parent. -->
  
  <xsl:template match="namespace-node()[..]" mode="snapshot" as="namespace-node()">
    <xsl:sequence select="f:graft-to-parent(.)/namespace-node()[local-name(.) = local-name(current())]"/>
  </xsl:template>
  
  <!-- make a copy of the parent of a supplied node, with a copy of the supplied node attached
         as a child/attribute/namespace of the new parent as appropriate -->
  
  <xsl:function name="f:graft-to-parent" as="node()">
    <xsl:param name="n" as="node()"/>
    <xsl:apply-templates select="$n/.." mode="snapshot-ancestor">
      <xsl:with-param name="child" select="$n"/>
    </xsl:apply-templates>
  </xsl:function>
  
  <!-- make a copy of the parent of a supplied node, with a copy of the supplied node attached
         as a child/attribute/namespace of the new parent as appropriate, grafted on to a copy
         of its own parent, recursively -->
  
  <xsl:template match="node()[..]" mode="snapshot-ancestor">
    <xsl:param name="child" required="yes"/>
    <xsl:apply-templates select=".." mode="snapshot-ancestor">
      <xsl:with-param name="child" as="node()">
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:copy-of select="$child"/>
        </xsl:copy>
      </xsl:with-param>
    </xsl:apply-templates>
  </xsl:template>
  
  <!-- make a copy of the parent of a supplied node, with a copy of the supplied node attached
         as a child/attribute/namespace of the new parent as appropriate, in the case where the
         parent is the root of the tree -->
  
  <xsl:template match="/ | node()[not(..)]" mode="snapshot-ancestor">
    <xsl:param name="child" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:copy-of select="$child"/>
    </xsl:copy>
  </xsl:template>
  
  


</xsl:stylesheet>