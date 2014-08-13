<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <!-- cannot mix values with and without timezone -->
    
    <xsl:template name="main">
      <out>
        <xsl:try>
           <xsl:variable name="m1" as="item()">
              <xsl:map>
                 <xsl:map-entry key="xs:dateTime('2000-12-31T12:00:00')"/>
                 <xsl:map-entry key="xs:date('2000-12-31Z')"/>
              </xsl:map>
           </xsl:variable>
           <size><xsl:value-of select="map:size($m1)"/></size>
           <xsl:catch>
             <caught error="{$err:code}"/>
           </xsl:catch>
        </xsl:try>      
        <xsl:try>
           <xsl:variable name="m1" as="item()">
              <xsl:map>
                 <xsl:map-entry key="xs:dateTime('2000-12-31T12:00:00+05:00')"/>
                 <xsl:map-entry key="xs:date('2000-12-31')"/>
              </xsl:map>
           </xsl:variable>
           <size><xsl:value-of select="map:size($m1)"/></size>
           <xsl:catch>
             <caught error="{$err:code}"/>
           </xsl:catch>
        </xsl:try> 
      </out>  
    </xsl:template>   
    
</xsl:stylesheet>