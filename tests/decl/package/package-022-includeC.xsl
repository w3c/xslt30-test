<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pkg="urn:use-me"
    version="3.0">
    
    <!-- two xsl:use-package with the same package, are considered two different packages with the same content
        to resolve a conflict, overlapping declarations can be hidden in one use-package and accepted in the other -->
    
    <xsl:use-package name="urn:use-me" package-version="*"  >
        <xsl:accept component="function" names="pkg:function1" visibility="hidden" />
    </xsl:use-package>
    
    <xsl:use-package name="urn:use-me" package-version="*"  >
        <xsl:accept component="function" names="pkg:function1" visibility="public" />
    </xsl:use-package>
    
    <xsl:template match="second-child">
        <xsl:value-of select="pkg:function1()" />
    </xsl:template>
    
</xsl:stylesheet>