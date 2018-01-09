<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsla="http://www.w3.org/1999/XSL/Transform/Alias"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    xmlns:r="http://www.w3.org/2012/11/xslt30-test-results"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    
    <xsl:import href="assert.xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Run this stylesheet with catalog.xml as the principal source document -->
    <!-- The output of the stylesheet is a report indicating which tests passed/failed -->
    
    <!-- Regex indicating which test sets should be run: default matches all test sets -->
    <xsl:param name="s" as="xs:string" select="'.*'"/>
    
    <!-- Regex indicating which test cases should be run: default matches all tests -->
    <xsl:param name="t" as="xs:string" select="'.*'"/>
    
    <!-- Dependencies satisfied by the product under test. Typically overridden in an overlay -->
    <xsl:variable name="dependencies" as="element(*)*">
        <spec value="XSLT30"/>
    </xsl:variable>
    
    <!-- Test cases that should be skipped, with reasons. Typically overridden in an overlay -->
    <xsl:variable name="exceptions" as="element(test-case)*">
        <!--<test-case name="id-015" reason="too slow"/>-->
    </xsl:variable>
    
    <!-- Process the catalog.xml file -->
    
    <xsl:template match="/">
        <xsl:variable name="report">
            <r:test-suite-result>
                <r:test-run dateRun="{current-date()}" testsuiteVersion="3.0.1"/>
                <xsl:apply-templates select="c:catalog/c:test-set[matches(@name, '^' || $s || '$')]"/>
            </r:test-suite-result> 
        </xsl:variable>
        <xsl:message>Passed: {count($report//*[@result='pass'])} Failed: {count($report//*[@result='fail'])} NotRun: {count($report//*[@result='not-run'])}</xsl:message>
        <xsl:sequence select="$report"/>
    </xsl:template>
    
    <!-- Process a test-set element in the catalog.xml file -->
    
    <xsl:template match="c:test-set">
        <xsl:apply-templates select="document(@file)/*/c:test-case[matches(@name, '^' || $t || '$')]"/>
    </xsl:template>
    
    <!-- Function to determine whether a test case should be omitted. This can be overridden in 
        an overlay. The function takes a test-case element as its argument. It returns an
        empty sequence if the function should be run, or a string explaining why the test
        is not run; this will be added to the output file. -->
    
    <xsl:function name="c:exception" as="xs:string?">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:sequence select="$exceptions[@name = $test/@name]/@reason"/>
    </xsl:function>
    
    <xsl:function name="c:dependencies-are-satisfied" as="xs:boolean">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:variable name="depends" select="$test/(.|..)/c:dependencies/*[not(self::c:spec)]"/>
        
        <xsl:variable name="ok" 
            select="every $d in $depends satisfies 
                    some $f in $dependencies[node-name(.) eq node-name($d) and (@value, '')[1] eq ($d/@value, '')[1]] satisfies
                    ($f/@satisfied = 'maybe' or ($f/@satisfied, 'true')[1] eq ($d/@satisfied, 'true')[1])"/>
        <xsl:if test="not($ok)">
            <xsl:message>Dependencies not satisfied</xsl:message>
        </xsl:if>
        <xsl:sequence select="$ok"/>
    </xsl:function>
    
    <xsl:template match="c:test-case">
        <xsl:variable name="exception" select="c:exception(.)"/>
        <xsl:choose>
            <xsl:when test="exists($exception)">
                <r:test-case name="{@name}" result="not-run" comment="{$exception}"/>
            </xsl:when>
            <xsl:when test="not(c:dependencies-are-satisfied(.))">
                <r:test-case name="{@name}" result="not-run" comment="dependencies not satisfied"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>TEST {@name}</xsl:message>
                <xsl:variable name="outcome" as="map(*)">
                    <xsl:apply-templates select="." mode="run-test"/> 
                </xsl:variable>
                <xsl:variable name="passed" as="xs:boolean">
                    <xsl:apply-templates select="c:result/*" mode="check-result">
                        <xsl:with-param name="result" as="map(*)" select="$outcome" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:variable>
                <r:test-case name="{@name}" result="{if ($passed) then 'pass' else 'fail'}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Get the environment for a test case if there is one, or () otherwise -->
    
    <xsl:function name="c:get-environment" as="element(c:environment)?">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:sequence select="$test/c:environment[not(@ref)], 
            $test/../c:environment[@name = $test/c:environment/@ref]"/>
    </xsl:function>
    
    <xsl:template match="c:test-case" mode="run-test" as="map(*)">
        <xsl:try>
            <xsl:variable name="env" select="c:get-environment(.)"/>
            <xsl:variable name="stylesheet" select="document((c:test|$env)/c:stylesheet/@file)"/>
            <xsl:variable name="source" select="c:get-source($env/c:source[@role='.'])"/>
            <xsl:variable name="options" as="map(*)">
                <xsl:map>
                    <xsl:map-entry key="'stylesheet-node'" select="$stylesheet"/>
                    <xsl:if test="exists($source)">
                        <xsl:map-entry key="'source-node'" select="$source"/>
                    </xsl:if>
                    <xsl:if test="exists(c:test/c:initial-template)">
                        <xsl:map-entry key="'initial-template'" select="c:resolve-QName-no-default(c:test/c:initial-template/@name, c:test/c:initial-template)"/>
                    </xsl:if>
                </xsl:map>
            </xsl:variable>
        
            <xsl:variable name="transform-result" select="c:transform($options)"/>
            <xsl:message>TRANSFORM RESULT: {serialize($transform-result?output, map{'method':'xml'})}</xsl:message>
            <xsl:sequence select="$transform-result"/>
            <xsl:catch errors="*">
                <xsl:message>TRANSFORM ERROR: {$err:code} {$err:description}</xsl:message>
                <xsl:sequence select="map{'error-code': local-name-from-QName($err:code)}"/>
            </xsl:catch>
        </xsl:try>       
    </xsl:template>
    
    <!-- Resolve a lexical QName against the namespace context of a supplied element.
        This differs from the standard fn:resolve-QName function in that a name with
        no prefix is treated as being in no namespace -->
    
    <xsl:function name="c:resolve-QName-no-default">
        <xsl:param name="lexical" as="xs:string"/>
        <xsl:param name="element" as="element(*)"/>
        <xsl:sequence select="if (contains($lexical, ':')) then resolve-QName($lexical, $element) else QName('', $lexical)"/>
    </xsl:function>
    
    <!-- Invoke an XSLT transformation. The interface is the same as the fn:transform(), and
        the default implementation simply calls fn:transform(), but this may be overridden with
        a custom implementation. This may be necessary, for example, if the target transformation
        is to run under a different software configuration -->
    
    <xsl:function name="c:transform" as="map(*)">
        <xsl:param name="options" as="map(*)"/>
        <xsl:sequence select="transform($options)"/>
    </xsl:function>
    
    <xsl:function name="c:get-source" as="document-node()?">
        <xsl:param name="source" as="element(c:source)?"/>
        <xsl:choose>
            <xsl:when test="empty($source)"/>
            <xsl:when test="$source/@validation = 'strict'">
                <xsl:sequence select="c:validated-document(resolve-uri($source/@file, base-uri($source)), resolve-uri($source/../c:schema/@file, base-uri($source)))"/>
            </xsl:when>
            <xsl:when test="$source/c:content">
                <xsl:sequence select="parse-xml($source/c:content)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="document($source/@file)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- Load a document validated using a schema from a given URL. -->
    
    <xsl:function name="c:validated-document" as="document-node()">
        <xsl:param name="instance-uri" as="xs:anyURI"/>
        <xsl:param name="schema-uri" as="xs:anyURI"/>
        <xsl:variable name="stylesheet">
            <xsla:stylesheet version="3.0">
                <xsla:import-schema schema-location="{$schema-uri}"/>
                <xsla:template name="go">
                    <xsla:source-document href="{$instance-uri}" validation="strict">
                        <xsla:sequence select="."/>
                    </xsla:source-document>
                </xsla:template>
            </xsla:stylesheet>
        </xsl:variable>
        <xsl:sequence select="transform(map{
            'stylesheet-node':$stylesheet, 'initial-template':QName('', 'go')})?output"/>
    </xsl:function>
    
    <xsl:namespace-alias stylesheet-prefix="xsla" result-prefix="xsl"/>
    
</xsl:stylesheet>