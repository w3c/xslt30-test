<?xml version="1.0" encoding="UTF-8"?>
<xslt:transform xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xs"
                version="2.0"
                default-validation="strip">
<!-- Purpose: Test case that uses default-validation="strip" to test whether 
  				type annotation is stripped in an attribute constructed inside 
  				an xsl:document. -->

   <xslt:output method="xml" encoding="UTF-8" indent="no"/>

   <xslt:variable name="v" as="document-node()*">
  		  <xslt:document>
  			    <xslt:text>
</xslt:text>
  			    <child xmlns:xsl="http://www.w3.org/1999/XSL/Transform">1 first child</child>
  			    <xslt:text>
</xslt:text>
  			    <xslt:element name="child">
  				      <xslt:attribute name="number">2</xslt:attribute> second child</xslt:element>
  			    <xslt:text>
</xslt:text>
  		  </xslt:document>
  	</xslt:variable>

   <xslt:template match="doc">
		    <out>
         <xslt:text>
</xslt:text>
         <xslt:value-of select="$v/child[2]/@number instance of attribute(*,xs:untypedAtomic)"/>
      </out>
	  </xslt:template>
</xslt:transform>
