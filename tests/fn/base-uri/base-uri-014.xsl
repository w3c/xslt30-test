<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform"
             xml:base="http://www.example.org/"
             version="2.0">
<!-- Purpose: Test with base-uri() on LRE and elements created with xsl:element. 
  				Stylesheet and each element has different xml:base explicitly set.-->

   <t:variable name="x">
		    <abc xmlns:xsl="http://www.w3.org/1999/XSL/Transform">/xxx/<t:value-of select="static-base-uri()"/>
      </abc>
	  </t:variable>

   <t:variable name="y">
		    <t:element name="abc">
			      <t:attribute name="xml:base">/yyy/</t:attribute>
			      <t:value-of select="static-base-uri()"/>
		    </t:element>
	  </t:variable>

   <t:template match="/" xml:base="/main/">
		    <out>
         <t:text>
</t:text>
         <static-base>
            <t:value-of select="static-base-uri()"/>
         </static-base>
         <t:text>
</t:text>
         <example1>
            <t:value-of select="base-uri($x/abc)"/>: <t:copy-of select="$x"/>
         </example1>
         <t:text>
</t:text>
         <example2>
            <t:value-of select="base-uri($y/abc)"/>: <t:copy-of select="$y"/>
         </example2>
      </out>
	  </t:template>
</t:transform>
