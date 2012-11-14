<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: Testcase to verify that when collation attribute is used with xsl:sort, its value is used to determine the sorting order, 
  				and other attributes (lang, case-order) are ignored. Included cases:
				- no attributes specified; only @lang; only @case-order;  both @lang and @case-order-->

   <t:template match="/"> 
      <t:text>
</t:text>
      <out>
Collation - sort no attributes<t:text>
</t:text>
         <t:for-each select="doc/item">

            <t:sort select="@target"
                    collation="http://www.w3.org/2005/xpath-functions/collation/codepoint"/>
            <t:value-of select="position()"/>
            <t:text>:</t:text>
            <t:value-of select="@num"/>
            <t:text> * </t:text>
         </t:for-each>
         <t:text>
</t:text>
Collation - sort with lang attribute<t:text>
</t:text>
         <t:for-each select="doc/item">

            <t:sort select="@target"
                    collation="http://www.w3.org/2005/xpath-functions/collation/codepoint"
                    lang="sv"/>
            <t:value-of select="position()"/>
            <t:text>:</t:text>
            <t:value-of select="@num"/>
            <t:text> * </t:text>
         </t:for-each>
         <t:text>
</t:text>
Collation - sort with case-order attribute<t:text>
</t:text>
         <t:for-each select="doc/item">

            <t:sort select="@target"
                    collation="http://www.w3.org/2005/xpath-functions/collation/codepoint"
                    case-order="upper-first"/>
            <t:value-of select="position()"/>
            <t:text>:</t:text>
            <t:value-of select="@num"/>
            <t:text> * </t:text>
         </t:for-each>
         <t:text>
</t:text>
Collation - sort with lang and case-order attributes<t:text>
</t:text>
         <t:for-each select="doc/item">

            <t:sort select="@target"
                    collation="http://www.w3.org/2005/xpath-functions/collation/codepoint"
                    lang="sv"
                    case-order="upper-first"/>
            <t:value-of select="position()"/>
            <t:text>:</t:text>
            <t:value-of select="@num"/>
            <t:text> * </t:text>
         </t:for-each>
      </out>
   </t:template>
</t:transform>
