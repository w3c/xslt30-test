<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://myfunctions"
    exclude-result-prefixes="xs math f"
    version="3.0">
    
    <!--
        This test creates a list of NCName characters allowed by XML 1.0 ed. 5.
        
        Features tested are:
        - inclusion of stylesheet with xsl:initial-template in included file
        - inclusion of static param in included file
        - setting that param and changing mode based on the static param
        - text and XML output based on static param
        - ability of a processor to generate all NCName characters
        - ability of a processor to create a DTD (through method = "text") with appropriate encoding and said characters
        
    -->
    
    <xsl:include href="ncname/ncname.xsl"/>
    
</xsl:stylesheet>