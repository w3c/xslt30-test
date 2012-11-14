<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:my="http://myfunc.org"
             xmlns:t="http://www.w3.org/1999/XSL/Transform"
             exclude-result-prefixes="my"
             version="2.0">
<!-- Purpose: Test with xsl:function that has @as="item()*" and the sequence 
  				constructor contains one of: -nothing, LREs, xsl:value-of, 
  				xsl:sequence, sequence of xsl:element, xsl:document-->

   <t:output method="xml" encoding="UTF-8"/>

   <t:function name="my:func1" as="item()*">
	
</t:function>

   <t:function name="my:func2" as="item()*">
	     <i1 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">foo</i1>
	     <i2 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">bar</i2>
	     <i3 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">foo</i3>
   </t:function>

   <t:function name="my:func3" as="item()*">
	     <t:value-of select="document('builtinas20_355.xml')/doc/item"/>
   </t:function>

   <t:function name="my:func4" as="item()*">
	     <t:sequence select="(1,2,3)"/>
   </t:function>

   <t:function name="my:func5" as="item()*">
	     <t:element name="temp">1</t:element>
	     <t:element name="a">2</t:element>
	     <t:element name="b">3</t:element>
   </t:function>

   <t:function name="my:func6" as="item()*">
	     <t:document>
		       <item xmlns:xsl="http://www.w3.org/1999/XSL/Transform">my element</item>
	     </t:document>
   </t:function>

   <t:template match="/doc">
      <out>
         <t:text>
</t:text>
         <func1>
            <t:value-of select="my:func1() instance of item()*"/>
            <t:value-of select="my:func1() instance of item()"/>
         </func1>
         <t:text>
</t:text>
         <func2>
            <t:value-of select="my:func2() instance of item()*"/>
            <t:value-of select="my:func2() instance of item()"/>
         </func2>
         <t:text>
</t:text>
         <func3>
            <t:value-of select="my:func3() instance of item()*"/>
            <t:value-of select="my:func3() instance of item()"/>
         </func3>
         <t:text>
</t:text>
         <func4>
            <t:value-of select="my:func4() instance of item()*"/>
            <t:value-of select="my:func4() instance of item()"/>
         </func4>
         <t:text>
</t:text>
         <func5>
            <t:value-of select="my:func5() instance of item()*"/>
            <t:value-of select="my:func5() instance of item()"/>
         </func5>
         <t:text>
</t:text>
         <func6>
            <t:value-of select="my:func6() instance of item()*"/>
            <t:value-of select="my:func6() instance of item()"/>
         </func6>
      </out>
   </t:template>
</t:transform>
