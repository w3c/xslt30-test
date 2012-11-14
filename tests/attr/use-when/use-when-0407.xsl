<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose:  Tests using function-available for generate-id,system-property, key, current
  				unparsed-entity-uri, and unparsed-entity-public-id in an use-when instruction. -->

   <t:template match="/">
		    <out>
         <t:call-template name="temp"/>
         <in>function-available('current')current: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('current')"/>
         </in>
         <t:text>
</t:text>
         <in>function-available('generate-id')generate-id: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('generate-id')"/>
         </in>
         <t:text>
</t:text>
         <in>function-available('key')key: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('key')"/>
         </in>
         <t:text>
</t:text>
         <in>function-available('unparsed-entity-uri')unparsed-entity-uri: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('unparsed-entity-uri')"/>
         </in>
         <t:text>
</t:text>
         <in>function-available('unparsed-entity-public-id')unparsed-entity-public-id: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('unparsed-entity-public-id')"/>
         </in>
         <t:text>
</t:text>
         <in>function-available('system-property')system-property: <t:value-of select="'use-when evaluates to true!!!'"
                        use-when="function-available('system-property')"/>
         </in>
         <t:text>
</t:text>
      </out>
	  </t:template>

   <t:template name="temp">
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('current')= <t:value-of select="function-available('current')"/>
      </inside_namedTemp>
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('generate-id')= <t:value-of select="function-available('current')"/>
      </inside_namedTemp>
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('key')= <t:value-of select="function-available('key')"/>
      </inside_namedTemp>	
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('unparsed-entity-uri')= <t:value-of select="function-available('unparsed-entity-uri')"/>
      </inside_namedTemp>	
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('unparsed-entity-public-id')= <t:value-of select="function-available('unparsed-entity-public-id')"/>
      </inside_namedTemp>							
		    <t:text>
</t:text>
		    <inside_namedTemp>function-available('system-property')= <t:value-of select="function-available('system-property')"/>
      </inside_namedTemp>							
		    <t:text>
</t:text>		
	  </t:template>
</t:transform>
