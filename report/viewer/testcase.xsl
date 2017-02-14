<xsl:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0" xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all" expand-text="yes" 
    extension-element-prefixes="ixsl prop style">



    <xsl:template match="/" name="main">
        <ixsl:schedule-action document="{resolve-uri(//cat:test-set[@name=ixsl:query-params()?s]/@file, base-uri(.))}">
            <xsl:call-template name="handle-test-set"/>
        </ixsl:schedule-action>
    </xsl:template>


    <xsl:template name="handle-test-set">
        <xsl:variable name="test-case" select="//cat:test-case[@name=ixsl:query-params()?t]"/>
        <xsl:result-document href="#metadata" method="ixsl:replace-content">
            <pre>
                <xsl:copy-of select="$test-case"/>
            </pre>
        </xsl:result-document>
    </xsl:template>





</xsl:transform>
