<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0">
<!-- Purpose: Test type of global xsl:param,  @as="item()" and @select contains one of:
				- xs:untypedAtomic from input file, explicitly created built-in primitive 
				type (xs:double), attribute() from input file, document-node() from input
				file, element from temporary tree, literal string -->

   <xslt:variable name="temporary-tree">
	<a>
         <b att="one">hello</b>
    </a>
   </xslt:variable>

   <xslt:param name="par1" select="doc/item/text()" as="item()"/>

   <xslt:param name="par2" select="xs:double(2.0)" as="item()"/>

   <xslt:param name="par3" select="doc/item/@attrib" as="item()"/>

   <xslt:param name="par4" select="/" as="item()"/>

   <xslt:param name="par5" select="$temporary-tree/a/b" as="item()"/>

   <xslt:param name="par6" select="'item'" as="item()"/>

   <xslt:template match="/doc">


      <out>
         <xslt:text>
</xslt:text>
         <e1>
            <xslt:value-of select="$par1 instance of item()"/>
         </e1>
         <xslt:text>
</xslt:text>
         <e2>
            <xslt:value-of select="$par2 instance of item()"/>
         </e2>
         <xslt:text>
</xslt:text>
         <e3>
            <xslt:value-of select="$par3 instance of item()"/>
         </e3>
         <xslt:text>
</xslt:text>
         <e4>
            <xslt:value-of select="$par4 instance of item()"/>
         </e4>
         <xslt:text>
</xslt:text>
         <e5>
            <xslt:value-of select="$par5 instance of item()"/>
         </e5>
         <xslt:text>
</xslt:text>
         <e6>
            <xslt:value-of select="$par6 instance of item()"/>
         </e6>
      </out>
   </xslt:template>
</xslt:transform>
