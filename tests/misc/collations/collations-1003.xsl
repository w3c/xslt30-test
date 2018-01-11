<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: To verify that the Unicode code point collation URI is the first recognized and used value from a list specified in a default-collation attribute.-->

   <t:output method="xml" indent="no" encoding="UTF-8"/>

   <t:template match="/"
               default-collation="http://www.none1.org http://www.none2.org http://www.w3.org/2005/xpath-functions/collation/codepoint http://frenchcollation.org">
      <out>
         <Compare>
            <t:value-of select="compare('b', 'ä')"/>
         </Compare>
         <Contains>
            <t:value-of select="contains('Strasse', 'ß')"/>
         </Contains>
         <Starts-with>
            <t:value-of select="starts-with('Sstrasse', 'ß')"/>
         </Starts-with>
         <Ends-with>
            <t:value-of select="ends-with('Strass', 'ß')"/>
         </Ends-with>
         <Subtring-before>
            <t:value-of select="substring-before('Strasse', 'raß')"/>
         </Subtring-before>
         <Substring-after>
            <t:value-of select="substring-after('Strasse', 'raß')"/>
         </Substring-after>
         <Index-of>
            <t:value-of select="index-of(('SS', 's', 'sse', 'ss'), 'ß')"/>
         </Index-of>
         <Distinct-values>
            <t:value-of select="distinct-values(('Strasse', 'Straß'))"/>
         </Distinct-values>
         <Deep-equal>
            <t:value-of select="deep-equal('Strasse', 'Straße')"/>
         </Deep-equal>
         <Max>
            <t:value-of select="max(('z', 'ä'))"/>
         </Max>
         <Min>
            <t:value-of select="max(('z', 'ä'))"/>
         </Min>
      </out>
   </t:template>
</t:transform>
