<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:f="http://f.com/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" expand-text="true">
   <!-- Purpose: Test with UCA collation: effect of the "alternate" option (which controls handling of space and punctuation).-->

   <t:output method="xml" encoding="UTF-8" indent="no"/>

   <t:variable name="in" as="xs:string*"
      select="tokenize('delug de-luge delu-ge deluge Deluge deluge-')"/>

   <t:template name="t:initial-template">
      <out>
         <primary>
            <non-ignorable>{f:sort("non-ignorable","primary")}</non-ignorable>
            <shifted>{f:sort("shifted","primary")}</shifted>
            <blanked>{f:sort("blanked","primary")}</blanked>
         </primary>
         <secondary>
            <non-ignorable>{f:sort("non-ignorable","secondary")}</non-ignorable>
            <shifted>{f:sort("shifted","secondary")}</shifted>
            <blanked>{f:sort("blanked","secondary")}</blanked>
         </secondary>
         <tertiary>
            <non-ignorable>{f:sort("non-ignorable","tertiary")}</non-ignorable>
            <shifted>{f:sort("shifted","tertiary")}</shifted>
            <blanked>{f:sort("blanked","tertiary")}</blanked>
         </tertiary>
      </out>
   </t:template>

   <t:function name="f:sort">
      <t:param name="option" as="xs:string"/>
      <t:param name="strength" as="xs:string"/>
      <t:perform-sort select="$in">
         <t:sort select="."
            collation="http://www.w3.org/2013/collation/UCA?lang=en;strength={$strength};alternate={$option}"/>
      </t:perform-sort>
   </t:function>
</t:transform>
