<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
>

<!-- Test avg() over sequences -->
<?spec fo#func-avg?>

<xsl:template match="/">
  <out>;
    <xsl:value-of select="avg(())"/>;
    <xsl:value-of select="avg((1))"/>;   
    <xsl:value-of select="avg((1,2,4))"/>;
    <xsl:value-of select="avg(//item/@val)"/>;    
  </out>
</xsl:template>
 
</xsl:stylesheet>
