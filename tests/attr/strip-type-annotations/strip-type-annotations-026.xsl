<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                input-type-annotations="strip"
                version="2.0">
<!-- Purpose: Show that when @input-type-annotations="strip", is-id and is-idref properties of element 
  				and attribute nodes are preserved when input is validated againt a DTD.-->

   <xslt:template match="/doc-id">
      <xslt:text>
</xslt:text>
      <out>
         <xslt:text>
</xslt:text>
         <E1>
            <xslt:value-of select="data(id-elem[1]/@id) instance of xs:ID"/>
         </E1>
         <xslt:text>
</xslt:text>
         <E2>
            <xslt:value-of select="data(id-elem[2]/@id) instance of xs:ID"/>
         </E2>
         <xslt:text>
</xslt:text>
         <E3>
            <xslt:value-of select="data(idref-elem/@ref) instance of xs:IDREF"/>
         </E3>
         <xslt:text>
</xslt:text>
         <E4>
            <xslt:value-of select="data(idref-elem/@refs) instance of attribute(*, xs:IDREFS)"/>
         </E4>
         <xslt:text>
</xslt:text>
         <E5>
            <xslt:value-of select="id('a1')"/>
         </E5>
         <xslt:text>
</xslt:text>
         <E7>
            <xslt:value-of select="id('a2')"/>
         </E7>
         <xslt:text>
</xslt:text>
         <E8>
            <xslt:value-of select="idref('a1')/name()"/>
         </E8>
         <xslt:text>
</xslt:text>
         <E9>
            <xslt:value-of select="idref('a2')/name()"/>
         </E9>
         <xslt:text>
</xslt:text>
      </out>
   </xslt:template>
</xslt:transform>
