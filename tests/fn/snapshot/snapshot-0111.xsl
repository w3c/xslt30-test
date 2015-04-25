<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="1">

<xsl:strip-space elements="*"/>

<xsl:template match="/">
  <xsl:variable name="s" as="node()" select="snapshot(//*:boundedBy)/.."/>
  <out>
    <a>{count($s/ancestor::node()) = 1}</a>
    <a>{count($s/preceding-sibling::node()) = 0}</a>
    <a>{count($s/following-sibling::node()) = 0}</a>
    <a>{count($s/preceding::node()) = 0}</a>
    <a>{count($s/following::node()) = 0}</a>
    <a>{count($s/parent::node()) = 1}</a>
    <a>{count($s/child::node()) = 1}</a>
    <a>{count($s/descendant::*) = 4}</a>
    <a>{count($s/descendant::node()) = 6}</a>
    <a>{count($s/attribute::*) = 1}</a>
    <a>{count($s/namespace::*) = 3}</a>
  </out>
</xsl:template>



</xsl:stylesheet>