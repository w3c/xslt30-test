<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    expand-text="yes">
  
    
    <xsl:template name="main">
        <out>
            <xsl:copy-of select="transform( map { 'package-name': 'http://transform-006a/', 'package-version' : '1.*',
            'initial-template' : QName('', 'subsid'), 'delivery-format' : 'raw'})?output"/>
        </out>
    </xsl:template>

</xsl:stylesheet>