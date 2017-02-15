<xsl:transform xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:prop="http://saxonica.com/ns/html-property"
    xmlns:style="http://saxonica.com/ns/html-style-property"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0" xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all" expand-text="yes" 
    extension-element-prefixes="ixsl prop style">


    <xsl:template name="main">
        <xsl:message>Started...</xsl:message>
        <xsl:result-document href="#title">
            Test Case {ixsl:query-params()?t} (in test set {ixsl:query-params()?s}) 
        </xsl:result-document>
        <xsl:call-template name="handle-catalog">
            <xsl:with-param name="catalog-doc" select="doc(resolve-uri('../../catalog.xml', ixsl:get(ixsl:window(), 'location.href')))"></xsl:with-param>
        </xsl:call-template>
        <!--<ixsl:schedule-action document="{resolve-uri(//cat:test-set[@name=ixsl:query-params()?s]/@file, base-uri(.))}">
            <xsl:call-template name="handle-test-set"/>
        </ixsl:schedule-action>-->
    </xsl:template>
    
    <xsl:template name="handle-catalog">
        <xsl:param name="catalog-doc"/>
        <xsl:message>In handle-catalog... {count($catalog-doc)}</xsl:message>
        <xsl:call-template name="handle-test-set">
            <xsl:with-param name="test-set-doc" select="document($catalog-doc//cat:test-set[@name=ixsl:query-params()?s]/@file)"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="handle-test-set">
        <xsl:param name="test-set-doc"/>
        <xsl:variable name="test-case-name" select="ixsl:query-params()?t"/>
        <xsl:variable name="test-case" select="$test-set-doc//cat:test-case[@name=$test-case-name]"/>
        <xsl:result-document href="#metadata" method="ixsl:replace-content">
            <pre>
                <xsl:copy-of select="serialize($test-case)"/>
            </pre>
        </xsl:result-document>
        <xsl:result-document href="#stylesheet" method="ixsl:replace-content">
            <pre>
                <xsl:value-of select="unparsed-text(resolve-uri($test-case//cat:stylesheet/@file, base-uri($test-case)))"/>
            </pre>
        </xsl:result-document>
        <xsl:result-document href="#source" method="ixsl:replace-content">
            <xsl:variable name="env" select="$test-case/cat:environment"/>
            <xsl:variable name="document-filename" select="($env/cat:source/@file, $test-case/../cat:environment[@name = $env/@ref]/cat:source/@file)[1]"/>            
            <pre>
                <xsl:value-of select="unparsed-text(resolve-uri($document-filename, base-uri($test-case)))"/>
            </pre>
        </xsl:result-document>
    </xsl:template>





</xsl:transform>
