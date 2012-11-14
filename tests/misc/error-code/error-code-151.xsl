<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0"
xmlns:functx="http://functx.com/">

   <!-- Test case error190 -->
   <!-- Test that invalid top-level element xsl:garbage is detected -->
   <!-- Author: Michael Kay -->
   
   <?err XTST0010?>

    <xsl:template name="dataSet">
        <xsl:param name="pointValue" as="xs:integer"></xsl:param>
        <xsl:param name="yScaleFactorRight1" as="xs:integer"></xsl:param>
        
        <xsl:variable name="coordY" select="$pointValue div $yScaleFactorRight1"/>
        
        <circle cx="10" cy="{-$coordY}" r="4"/>
        
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:copy-of select='functx:wrap-values-in-elements(1 to 10, QName("http://my.com/", "ele"))'/>
    </xsl:template>
    
<xsl:function name="functx:wrap-values-in-elements" as="element()*">
  <xsl:param name="values" as="xs:anyAtomicType*"/> 
  <xsl:param name="elementName" as="xs:QName"/> 
 
   <xsl:for-each select="$values">
     <xsl:element name="{$elementName}"
                  namespace="{namespace-uri-from-QName($elementName)}">
       <xsl:sequence select="."/>
     </xsl:element>
   </xsl:for-each>
 
</xsl:function>

<xsl:garbage/>
    
</xsl:transform>