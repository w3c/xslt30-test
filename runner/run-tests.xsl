<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsla="http://www.w3.org/1999/XSL/Transform/Alias"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
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
    
    <xsl:variable name="base-output-dir" select="string(resolve-uri('output', static-base-uri())) || '/'"/>
    
    <!-- Dependencies satisfied by the product under test. Typically overridden in an overlay -->
    <xsl:variable name="satisfied-dependencies" as="element(*)*">
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
        <xsl:call-template name="summarize">
            <xsl:with-param name="report" select="$report"/>
        </xsl:call-template>
        <xsl:sequence select="$report"/>
    </xsl:template>
    
    <!-- Produce a summary report of test results -->
    
    <xsl:template name="summarize">
        <xsl:param name="report" as="document-node(element(r:test-suite-result))"/>
        <xsl:message>Passed: {count($report//*[@result='pass'])} Failed: {count($report//*[@result='fail'])} NotRun: {count($report//*[@result='not-run'])}</xsl:message>
        <xsl:message>Failures: </xsl:message>
        <xsl:for-each-group select="$report//r:test-case[@result='fail']" group-adjacent="@set">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:message>  {current-grouping-key()}: {count(current-group())}</xsl:message>
        </xsl:for-each-group>
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
    
    <xsl:function name="c:spec-is-satisfied" as="xs:boolean">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:variable name="spec" select="$test/(.|..)/c:dependencies/c:spec"/>
        <xsl:variable name="spec-ok" select="not($spec/@value = 'XSLT20')"/>
        <xsl:if test="not($spec-ok)">
            <xsl:message>Test {$test/@name}: Requires an XSLT 2.0 processor</xsl:message>
        </xsl:if>
        <xsl:sequence select="$spec-ok"/>
    </xsl:function>
    
    <xsl:function name="c:dependencies-are-satisfied" as="xs:boolean">
        <xsl:param name="test" as="element(c:test-case)"/>
        <xsl:variable name="test-dependencies" select="$test/(.|..)/c:dependencies/*[not(self::c:spec)]"/>
        <xsl:variable name="ok" as="xs:boolean">
            <xsl:iterate select="$test-dependencies">
                <xsl:on-completion select="true()"/>
                <xsl:variable name="product-features" select="$satisfied-dependencies[node-name(.) eq node-name(current())]"/>
                <xsl:choose>
                    <xsl:when test="empty($product-features)">
                        <xsl:message>No support for dependency {local-name()}</xsl:message>
                        <xsl:break select="false()"/>
                    </xsl:when>
                    <xsl:when test="not($product-features/@value = '*' or $product-features/@value = @value)">
                        <xsl:message>No support for dependency {local-name()} value {@value}</xsl:message>
                        <xsl:break select="false()"/>
                    </xsl:when>
                    <xsl:when test="$product-features/@satisfied  != @satisfied">
                        <xsl:message>Mismatched support for dependency {local-name()} value {@value}</xsl:message>
                        <xsl:break select="false()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:next-iteration/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:iterate>
        </xsl:variable>
        <xsl:sequence select="$ok"/>
    </xsl:function>
    
    <xsl:template match="c:test-case">
        <xsl:variable name="exception" select="c:exception(.)"/>
        <xsl:variable name="base-output-uri" select="string(resolve-uri(@name||'/principal-output.xml', $base-output-dir))"/>
        <xsl:choose>
            <xsl:when test="exists($exception)">
                <r:test-case set="{../@name}" name="{@name}" result="not-run" comment="{$exception}"/>
            </xsl:when>
            <xsl:when test="not(c:dependencies-are-satisfied(.))">
                <r:test-case set="{../@name}" name="{@name}" result="not-run" comment="dependencies not satisfied"/>
            </xsl:when>
            <xsl:when test="not(c:spec-is-satisfied(.))">
                <r:test-case set="{../@name}" name="{@name}" result="not-run" comment="not applicable to this XSLT version"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>TEST {@name}</xsl:message>
                <xsl:variable name="outcome" as="map(*)">
                    <xsl:apply-templates select="." mode="run-test">
                        <xsl:with-param name="base-output-uri" select="$base-output-uri" tunnel="yes"/>
                    </xsl:apply-templates> 
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$outcome?error-code">
                        <xsl:variable name="status" as="xs:string">
                            <xsl:apply-templates select="c:result/*" mode="expects-error">
                                <xsl:with-param name="code" as="xs:string" select="$outcome?error-code" tunnel="yes"/>
                            </xsl:apply-templates>       
                        </xsl:variable>
                        <r:test-case set="{../@name}" name="{@name}" result="{$status}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$outcome?error-code">
                            <xsl:message>Test reported {$outcome?error-code}: {$outcome?error-description}</xsl:message>
                        </xsl:if>
                        <xsl:variable name="passed" as="xs:boolean">
                            <xsl:apply-templates select="c:result/*" mode="check-result">
                                <xsl:with-param name="outcome" as="map(*)" select="$outcome" tunnel="yes"/>
                                <xsl:with-param name="result" as="item()*" select="$outcome($base-output-uri)" tunnel="yes"/>
                            </xsl:apply-templates>
                        </xsl:variable>
                        <xsl:if test="not($passed)">
                            <xsl:message>ACTUAL:</xsl:message>
                            <xsl:message select="$outcome($base-output-uri)"/>
                        </xsl:if>
                        <r:test-case set="{../@name}" name="{@name}" result="{if ($passed) then 'pass' else 'fail'}"/>
                    </xsl:otherwise>
                </xsl:choose>
                
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
        <xsl:param name="base-output-uri" as="xs:string" tunnel="yes"/>
        <xsl:try>
            <xsl:variable name="env" select="c:get-environment(.)"/>
            <xsl:variable name="dependencies" select="(.|..)/c:dependencies/*[not(self::c:spec)]"/>
            <xsl:variable name="stylesheet" select="document((c:test|$env)/c:stylesheet[not(@role='secondary')]/@file)"/>
            <xsl:variable name="package" select="document((c:test|$env)/c:package[not(@role='secondary')]/@file)"/>
            <xsl:variable name="serialize" select="c:test/c:output/@serialize = 'yes'"/>
            <xsl:variable name="options" as="map(*)">
                <xsl:map>
                    <xsl:map-entry key="'base-output-uri'" select="$base-output-uri"/>
                    
                    <xsl:if test="$stylesheet">
                        <xsl:map-entry key="'stylesheet-node'" select="$stylesheet[last()]"/>
                    </xsl:if>
                    
                    <xsl:if test="$package">
                        <xsl:map-entry key="'package-node'" select="$package"/>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:initial-template)">
                        <xsl:map-entry key="'initial-template'" 
                                       select="c:resolve-QName-no-default(c:test/c:initial-template/@name, c:test/c:initial-template)"/>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:initial-function)">
                        <xsl:map-entry key="'initial-function'" 
                                       select="c:resolve-QName-no-default(c:test/c:initial-function/@name, c:test/c:initial-function)"/>
                        <xsl:variable name="params" as="array(item()*)">
                            <xsl:iterate select="c:test/c:initial-function/c:param">
                                <xsl:param name="array" select="[]"/>
                                <xsl:on-completion select="$array"/>
                                <xsl:variable name="member" as="item()*">
                                    <xsl:evaluate xpath="@select"/>
                                </xsl:variable>
                                <xsl:next-iteration>
                                    <xsl:with-param name="array" select="array:append($array, $member)"/>
                                </xsl:next-iteration>
                            </xsl:iterate>
                        </xsl:variable>
                        <xsl:map-entry key="'function-params'" select="$params"/>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:initial-mode/@name)">
                        <xsl:message>initial-mode {c:test/c:initial-mode/@name}</xsl:message>
                        <xsl:choose>
                            <xsl:when test="c:test/c:initial-mode/@name castable as xs:QName">
                                <xsl:map-entry key="'initial-mode'" select="c:resolve-QName-no-default(c:test/c:initial-mode/@name, c:test/c:initial-mode)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="c:handle-special-initial-mode(c:test/c:initial-mode/@name)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:initial-mode/@select)">
                        <xsl:message>initial-match-selection {c:test/c:initial-mode/@select}</xsl:message>
                        <xsl:map-entry key="'initial-match-selection'">
                            <xsl:evaluate xpath="c:test/c:initial-mode/@select"/>
                        </xsl:map-entry>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:param[not(@static=('yes', 'true', '1'))])">
                        <xsl:map-entry key="'stylesheet-params'">
                            <xsl:map>
                                <xsl:for-each select="c:test/c:param[not(@static=('yes', 'true', '1'))]">
                                    <xsl:map-entry key="QName('', @name)">
                                        <xsl:evaluate xpath="@select"/>
                                    </xsl:map-entry>
                                </xsl:for-each>
                            </xsl:map>
                        </xsl:map-entry>
                    </xsl:if>
                    
                    <xsl:if test="exists(c:test/c:param[@static=('yes', 'true', '1')])">
                        <xsl:map-entry key="'static-params'">
                            <xsl:map>
                                <xsl:for-each select="c:test/c:param[@static=('yes', 'true', '1')]">
                                    <xsl:map-entry key="QName('', @name)">
                                        <xsl:evaluate xpath="@select"/>
                                    </xsl:map-entry>
                                </xsl:for-each>
                            </xsl:map>
                        </xsl:map-entry>
                    </xsl:if>
                    
                    <xsl:if test="$serialize">
                        <xsl:map-entry key="'delivery-format'" select="'serialized'"/>
                    </xsl:if>
                    
                    <xsl:if test="c:test/c:output/(@tree='no' and not(@serialize='yes'))">
                        <xsl:map-entry key="'delivery-format'" select="'raw'"/>
                    </xsl:if>
                    
                    <xsl:map-entry key="'requested-properties'">
                        <xsl:map>
                            <xsl:if test="$dependencies[self::c:feature[@value='schema_aware']]">
                                <xsl:map-entry key="xs:QName('xsl:is-schema-aware')" select="true()"/>
                            </xsl:if>
                        </xsl:map>
                    </xsl:map-entry>
                    
                </xsl:map>
            </xsl:variable>
            
            <!-- Now add to the $options map information about source documents -->
            
            <xsl:variable name="options" as="map(xs:string, item()*)">
                <xsl:iterate select="$env/c:source">
                    <xsl:param name="options" select="$options" as="map(xs:string, item()*)"/>
                    <xsl:on-completion select="$options"/>
                    <xsl:next-iteration>
                        <xsl:with-param name="options" as="map(xs:string, item()*)">
                            <xsl:apply-templates select="." mode="get-source-documents">
                                <xsl:with-param name="options" select="$options"/>
                            </xsl:apply-templates>
                        </xsl:with-param>    
                    </xsl:next-iteration>
                </xsl:iterate>
            </xsl:variable>
            
            <!-- Perform the transformation -->
        
            <xsl:variable name="transform-result" select="c:transform($options, .)"/>
            <!--<xsl:message>TRANSFORM RESULT: {serialize($transform-result?output, map{'method':'xml'})}</xsl:message>-->
            <xsl:sequence select="$transform-result"/>
            <xsl:catch errors="*">
                <xsl:message>TRANSFORM FAILURE: {$err:code} {$err:description}</xsl:message>
                <xsl:sequence select="map{'error-code': local-name-from-QName($err:code), 
                                          'error-description': $err:description}"/>
            </xsl:catch>
        </xsl:try>       
    </xsl:template>
    
    
    
    <!-- Mode get-source-documents is applied to c:source elements; the template rules in this mode
        accept the $options map as a parameter, and must return a new $options map, which
        is used in place of the original. Because fn:transform() as specified in XSLT 3.0
        has no mechanism to accept streamed input, a processor that intends to test streaming
        will need to override the template rule for streamable source documents to invoke
        streaming in an implementation-dependent way -->
    
    <xsl:mode name="get-source-documents" on-no-match="fail"/>
    
    <xsl:template match="c:source"  mode="get-source-documents" priority="5">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:sequence select="$options"/>
    </xsl:template>
    
    <xsl:template match="c:source[@role='.'][@file]" mode="get-source-documents" priority="10">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="tree" select="document(@file)"/>
        <xsl:sequence select="map:put($options, 'source-node', $tree)"/>
    </xsl:template>
    
    <xsl:template match="c:source[@role='.'][@file][@validation='strict']" mode="get-source-documents" priority="11">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="tree" select="c:validated-document(resolve-uri(@file, base-uri(.)), 
            (../c:schema[not(@role='secondary')]) ! resolve-uri(@file, base-uri(.)))"/>
        <xsl:sequence select="map:put($options, 'source-node', $tree)"/>
    </xsl:template>
    
    <xsl:template match="c:source[@role='.'][c:content]" mode="get-source-documents" priority="12">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="tree" select="parse-xml(string(c:content))"/>
        <xsl:sequence select="map:put($options, 'source-node', $tree)"/>
    </xsl:template>
    
    <xsl:template match="c:source[@role='.'][c:content][@validation='strict']" mode="get-source-documents" priority="13">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:variable name="tree" select="parse-xml(string(c:content))"/>
        <xsl:variable name="vtree" select="c:validate-tree($tree, resolve-uri(../c:schema[not(@role='secondary')]/@file, base-uri(.)))"/>
        <xsl:sequence select="map:put($options, 'source-node', $vtree)"/>
    </xsl:template>
    
    
    
    
    <!-- Resolve a lexical QName against the namespace context of a supplied element.
        This differs from the standard fn:resolve-QName function in that a name with
        no prefix is treated as being in no namespace -->
    
    <xsl:function name="c:resolve-QName-no-default">
        <xsl:param name="lexical" as="xs:string"/>
        <xsl:param name="element" as="element(*)"/>
        <xsl:sequence select="if (contains($lexical, ':')) then resolve-QName($lexical, $element) else QName('', $lexical)"/>
    </xsl:function>
    
    <!-- Handle one of the special initial mode values #unnamed or #default. The fn:transform
        interface makes no provision for these, so they must be handled in a product-specific way.
        This function is just a dummy; it can be overridden in an overlay -->
    
    <xsl:function name="c:handle-special-initial-mode">
        <xsl:param name="mode-name"/>
        <xsl:message terminate="yes">Cannot handle initial-mode="{$mode-name}"</xsl:message>
    </xsl:function>
    
    <!-- Invoke an XSLT transformation. The interface is the same as the fn:transform(), and
        the default implementation simply calls fn:transform(), but this may be overridden with
        a custom implementation. This may be necessary, for example, if the target transformation
        is to run under a different software configuration -->
    
    <xsl:function name="c:transform" as="map(*)">
        <xsl:param name="options" as="map(*)"/>
        <xsl:param name="test-case" as="element(c:test-case)"/>
        <xsl:sequence select="transform($options)"/>
    </xsl:function>
    

    
    <!-- Load a document validated using a schema from a given URL. -->
    
    <xsl:function name="c:validated-document" as="document-node()">
        <xsl:param name="instance-uri" as="xs:anyURI"/>
        <xsl:param name="schema-uri" as="xs:anyURI*"/>
        <xsl:variable name="stylesheet">
            <xsla:stylesheet version="3.0">
                <xsl:for-each select="$schema-uri">
                    <xsla:import-schema schema-location="{.}"/>
                </xsl:for-each>               
                <xsla:template name="go" as="document-node()">
                    <xsla:source-document href="{$instance-uri}" validation="strict">
                        <xsla:sequence select="."/>
                    </xsla:source-document>
                </xsla:template>
            </xsla:stylesheet>
        </xsl:variable>
        <xsl:message>Attempting validation of {$instance-uri} from URI</xsl:message>
        <xsl:sequence select="transform(map{
            'stylesheet-node':$stylesheet, 'initial-template':QName('', 'go')})?output"/>
    </xsl:function>
    
    <xsl:function name="c:validate-tree" as="document-node()">
        <xsl:param name="source" as="document-node()"/>
        <xsl:param name="schema-uri" as="xs:anyURI*"/>
        <xsl:variable name="stylesheet">
            <xsla:stylesheet version="3.0">
                <xsl:for-each select="$schema-uri">
                    <xsla:import-schema schema-location="{.}"/>
                </xsl:for-each>  
                <xsla:param name="doc"/>
                <xsla:template name="go" as="document-node()">
                    <xsla:copy-of select="$doc" validation="strict"/>
                </xsla:template>
            </xsla:stylesheet>
        </xsl:variable>
        <xsl:message>Attempting validation of {base-uri($source)} from node</xsl:message>
        <xsl:sequence select="transform(map{
            'stylesheet-node' : $stylesheet, 
            'initial-template' : QName('', 'go'), 
            'stylesheet-params': map{QName('', 'doc') : $source}})?output"/>
    </xsl:function>
    
    <!-- Update an inner map contained within an outer map, returning the new value
        of the outer map.
        $options - the outer map
        $key1 - the key value of the inner map within the outer map
        $key2 - the key value within the inner map
        $value - the value to be set for $key2 within the inner map -->
    
    <xsl:function name="c:inner-put" as="map(xs:string, item()*)">
        <xsl:param name="options" as="map(xs:string, item()*)"/>
        <xsl:param name="key1" as="xs:string"/>
        <xsl:param name="key2" as="xs:anyAtomicType"/>
        <xsl:param name="value" as="item()*"/>
        <xsl:variable name="map" select="($options($key1), map{})[1]"/>
        <xsl:variable name="updated-map" select="map:put($map, $key2, $value)"/>
        <xsl:sequence select="map:put($options, $key1, $updated-map)"/>
    </xsl:function>
    
    <xsl:namespace-alias stylesheet-prefix="xsla" result-prefix="xsl"/>
    
</xsl:stylesheet>