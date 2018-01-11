<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: To verify that the Unicode code point collation can be passed as an argument and is used in XPath functions that require collation.-->

   <t:output method="xml" indent="no" encoding="UTF-8"/>

   <t:template match="/">


	     <t:text>
</t:text>
      <out>
         <t:text>
</t:text>
         <Compare>
            <t:value-of select="compare('b', 'ä', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Compare>
         <t:text>
</t:text>
         <Contains>
            <t:value-of select="contains('Strasse', 'ß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Contains>
         <t:text>
</t:text>
         <Starts-with>
            <t:value-of select="starts-with('Sstrasse', 'ß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Starts-with>
         <t:text>
</t:text>
         <Ends-with>
            <t:value-of select="ends-with('Strass', 'ß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Ends-with>
         <t:text>
</t:text>
         <Subtring-before>
            <t:value-of select="substring-before('Strasse', 'raß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Subtring-before>
         <t:text>
</t:text>
         <Substring-after>
            <t:value-of select="substring-after('Strasse', 'raß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Substring-after>
         <t:text>
</t:text>
         <Index-of>
            <t:value-of select="index-of(('SS', 's', 'sse', 'ss'), 'ß', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Index-of>
         <t:text>
</t:text>
         <Distinct-values>
            <t:value-of select="distinct-values(('Strasse', 'Straß'), 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Distinct-values>
         <t:text>
</t:text>
         <Deep-equal>
            <t:value-of select="deep-equal('Strasse', 'Straße', 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Deep-equal>
         <t:text>
</t:text>
         <Max>
            <t:value-of select="max(('z', 'ä'), 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Max>
         <t:text>
</t:text>
         <Min>
            <t:value-of select="max(('z', 'ä'), 'http://www.w3.org/2005/xpath-functions/collation/codepoint')"/>
         </Min>
         <t:text>
</t:text>
      </out>
   </t:template>
</t:transform>
