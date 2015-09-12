<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <!-- xsl:merge test on city and weather data. -->
    <!-- the data files cities-SE.xml and weather-SE.xml were downloaded from openweathermap.org. The data
          was originally in JSON format; it was converted to XML, filtered to extract the data for Sweden,
          and sorted by city name in Swedish collating order. -->
    <xsl:output method="xml" indent="no"/>
    
    <xsl:template name="xsl:initial-template">
        <weather>
            <xsl:merge>                
                <xsl:merge-source name="cities"
                        streamable="yes"
                		for-each-stream="'cities-SE.xml'"
                		select="city-list/city">	
                    <xsl:merge-key select="position()"/>
                </xsl:merge-source>
                <xsl:merge-source name="weather"
                        streamable="no"
                		for-each-item="doc('weather-SE.xml')"
                		select="city-list/record">	
                    <xsl:merge-key select="position()"/>
                </xsl:merge-source>
                <xsl:merge-action>
                  <xsl:variable name="g" select="current-merge-group()/self::city"/>
                  <xsl:variable name="h" select="current-merge-group()/self::record"/>
                  <city pos="{current-merge-key()}"
                          name1="{$g/name}" name2="{$h/city/name}"
                          lon="{$g/coord/lon}" lat="{$g/coord/lat}" 
                          temp="{$h//temp}" wind="{$h//wind/speed}"/>       
                </xsl:merge-action>
            </xsl:merge>            
        </weather>
    </xsl:template>
</xsl:stylesheet>