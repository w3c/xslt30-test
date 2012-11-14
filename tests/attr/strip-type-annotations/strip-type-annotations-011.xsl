<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:xs="http://www.w3.org/2001/XMLSchema" 
				xmlns:my="http://ns.example.com/strip-type"
				exclude-result-prefixes="xs my"
				input-type-annotations="strip"
				version="2.0">

  <!-- This stylesheet is used for import / include tests -->

  <xsl:template name="temp2">
  	<xsl:text>&#10;</xsl:text>
  		<imported2>
  			<xsl:text>&#10;</xsl:text>
			<i1><xsl:value-of select="elem-duration instance of element(*, xs:duration)" />
				<xsl:value-of select="elem-duration instance of element(*, xs:untyped)" /></i1><xsl:text>&#10;</xsl:text>
			<i2><xsl:value-of select="elem-QName instance of element(*, xs:QName)" />
				<xsl:value-of select="elem-QName instance of element(*, xs:untyped)" /></i2><xsl:text>&#10;</xsl:text>
			<i3><xsl:value-of select="elem-string instance of element(*, xs:string)" />
				<xsl:value-of select="elem-string instance of element(*, xs:untyped)" /></i3><xsl:text>&#10;</xsl:text>
			<i4><xsl:value-of select="elem-NCName instance of element(*, xs:NCName)" />
				<xsl:value-of select="elem-NCName instance of element(*, xs:untyped)" /></i4><xsl:text>&#10;</xsl:text>
			<i5><xsl:value-of select="elem-NMTOKEN instance of element(*, xs:NMTOKEN)" />
				<xsl:value-of select="elem-NMTOKEN instance of element(*, xs:untyped)" /></i5><xsl:text>&#10;</xsl:text>
			<i6><xsl:value-of select="elem-nonPositiveInteger instance of element(*, xs:nonPositiveInteger)" />
				 <xsl:value-of select="elem-nonPositiveInteger instance of element(*, xs:untyped)" /></i6><xsl:text>&#10;</xsl:text>
			<i7><xsl:value-of select="elem-long instance of element(*, xs:long)" />
				 <xsl:value-of select="elem-long instance of element(*, xs:untyped)" /></i7><xsl:text>&#10;</xsl:text>
			<i8><xsl:value-of select="simple-derived instance of element(*, my:partNumberType)" />
				 <xsl:value-of select="simple-derived instance of element(*, xs:untyped)" /></i8><xsl:text>&#10;</xsl:text>
			<i9><xsl:value-of select="complex-derived instance of element(*, my:personType)" />
				 <xsl:value-of select="complex-derived instance of element(*, xs:untyped)" /></i9><xsl:text>&#10;</xsl:text>
			<i10><xsl:value-of select="complex-derived/familyName instance of element(*, xs:string)" />
				 <xsl:value-of select="complex-derived/familyName instance of element(*, xs:untyped)" /></i10><xsl:text>&#10;</xsl:text>
			<i11><xsl:value-of select="complex-derived/@age instance of attribute(*, xs:integer)" />
				 <xsl:value-of select="complex-derived/@age instance of attribute(*, xs:untypedAtomic)" /></i11><xsl:text>&#10;</xsl:text>
			<i12><xsl:value-of select="list-derived instance of element(*, my:myListType)" />
				 <xsl:value-of select="list-derived instance of element(*, xs:untyped)" /></i12><xsl:text>&#10;</xsl:text>
			<i13><xsl:value-of select="union-derived[1] instance of element(*, my:partIntegerUnion)"/>
				 <xsl:value-of select="union-derived[1] instance of element(*, xs:untyped)"/></i13><xsl:text>&#10;</xsl:text>
  		</imported2>
  </xsl:template>


</xsl:transform>