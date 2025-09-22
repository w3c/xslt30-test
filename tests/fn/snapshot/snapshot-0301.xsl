<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="4.0" expand-text="1">

  <xsl:strip-space elements="*"/>
  
  <xsl:template match="/">
    <xsl:variable name="s" as="node()" select="snapshot(//pivot)/ancestor::a"/>
    <xsl:variable name="results" as="element()*">
      <a actual="{count($s/ancestor::node())}">{count($s/ancestor::node()) = 1}</a>
      <b actual="{count($s/ancestor-or-self::node())}">{count($s/ancestor-or-self::node()) = 1}</b>
      <c actual="{count($s/ancestor::*)}">{count($s/ancestor::*) = 1}</c>
      <d actual="{count($s/ancestor-or-self::*)}">{count($s/ancestor-or-self::*) = 1}</d>
      <e actual="{count($s/descendant::*)}">{count($s/descendant::*) = 4}</e>
      <f actual="{count($s/descendant::node())}">{count($s/descendant::node()) = 4}</f>
      <g actual="{count($s/descendant-or-self::*)}">{count($s/descendant-or-self::*) = 6}</g>
      <h actual="{count($s/descendant-or-self::node())}">{count($s/descendant-or-self::node()) = 6}</h>
      <i actual="{count($s/following::node())}">{count($s/following::node()) = 0}</i>
      <j actual="{count($s/following::*)}">{count($s/following::*) = 0}</j>
      <k actual="{count($s/following-or-self::node())}">{count($s/following-or-self::node()) = 0}</k>
      <l actual="{count($s/following-or-self::*)}">{count($s/following-or-self::node()) = 0}</l>
      <m actual="{count($s/following-sibling::node())}">{count($s/following-sibling::node()) = 0}</m>
      <n actual="{count($s/following-sibling::*)}">{count($s/following-sibling::*) = 0}</n>
      <o actual="{count($s/following-sibling-or-self::node())}">{count($s/following-sibling::node()) = 0}</o>
      <p actual="{count($s/following-sibling-or-self::*)}">{count($s/following-sibling::*) = 0}</p>
      <q actual="{count($s/namespace::*)}">{count($s/namespace::*) = 1}</q>
      <r actual="{count($s/parent::node())}">{count($s/parent::node()) = 1}</r>
      <s actual="{count($s/parent::*)}">{count($s/parent::node()) = 0}</s>
      <t actual="{count($s/preceding::node())}">{count($s/preceding::node()) = 0}</t>
      <u actual="{count($s/preceding::*)}">{count($s/preceding::*) = 0}</u>
      <v actual="{count($s/preceding-or-self::node())}">{count($s/preceding-or-self::node()) = 0}</v>
      <w actual="{count($s/preceding-or-self::*)}">{count($s/preceding-or-self::node()) = 0}</w>
      <x actual="{count($s/preceding-sibling::node())}">{count($s/preceding-sibling::node()) = 0}</x>
      <y actual="{count($s/preceding-sibling::*)}">{count($s/preceding-sibling::*) = 0}</y>
      <z actual="{count($s/preceding-sibling-or-self::node())}">{count($s/preceding-sibling::node()) = 0}</z>
      <A actual="{count($s/preceding-sibling-or-self::*)}">{count($s/preceding-sibling::*) = 0}</A>
    </xsl:variable>
    <out>
      <xsl:copy-of select="$results[number(@actual) != number(.)]"/>
    </out>  
  </xsl:template>



</xsl:stylesheet>