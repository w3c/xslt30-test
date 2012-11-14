<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0">
<!-- Purpose: Tests use of a document node inside an instruction that is constructing simple content. -->

   <xslt:output method="xml" encoding="UTF-8" indent="no"/>

   <xslt:template match="/">
		    <xslt:variable name="v1">
  			    <xslt:value-of select="''"/>
		    </xslt:variable>

		    <xslt:text>
</xslt:text>

		    <xslt:variable name="v2">
			      <xslt:text/>
		    </xslt:variable>
		    <out>
         <xslt:text>
</xslt:text>
         <xslt:comment>
				        <xslt:document>
   					       <xslt:sequence select="doc/ch, doc//comment(), xs:integer('9456798'), xs:dayTimeDuration('P020DT03H')"/>
   					       <xslt:text>
</xslt:text>
					          <xslt:value-of separator="*"
                              select="('Old', '', 'est', $v1, 'att', '', 'rib', $v2,'ute')"/>
   				     </xslt:document>
   			   </xslt:comment>
         <xslt:text>
</xslt:text>
      </out>
	  </xslt:template>
</xslt:transform>
