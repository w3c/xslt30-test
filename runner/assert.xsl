<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT" xmlns:xp="http://saxonica.com/xpathParse" xmlns:X="XLST" xmlns:p="CR-xpath-30-20130108"
    xmlns:doc="http://www.saxonica.com/ns/documentation" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:saxon="http://saxon.sf.net/" xmlns:H="http://www.w3.org/1999/xhtml"
    xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:q="http://www.w3.org/2010/09/qt-fots-catalog"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    xmlns:d="http://ns.saxonica.com/diff"
    exclude-result-prefixes="#all" version="3.0" expand-text="yes"
    xpath-default-namespace="http://www.w3.org/2010/09/qt-fots-catalog">

    <xsl:include href="compare.xsl"/>
    
    
    <xsl:mode name="expects-error" on-no-match="fail">
        <!-- This mode is applied to assertion elements (children of c:result) when the result of the transformation
            is an error; the template is invoked with a tunnel parameter indicating the
            actual error code. The result is a string: 'fail' if no error was expected, 'pass' if an error was
            expected and the error code matches, 'wrong-error (explanation)' if an error was expected but the
            error code is wrong. -->
    </xsl:mode>
    
    <xsl:template match="*" mode="expects-error" as="xs:string">
        <xsl:sequence select="'fail'"/>
    </xsl:template>
    
    <xsl:template match="c:error | c:assert-serialization-error" mode="expects-error" as="xs:string">
        <xsl:param name="code" as="xs:string" tunnel="yes"/>
        <xsl:sequence select="if ($code = @code) then 'pass' else 'wrong-error (expected ' || @code || ', got ' || $code ||')'"/>
    </xsl:template>
    
    <xsl:template match="c:all-of" mode="expects-error" as="xs:string">
        <xsl:iterate select="*">
            <xsl:on-completion select="'pass'"/>
            <xsl:variable name="t" as="xs:string">
                <xsl:apply-templates select="." mode="#current"/>
            </xsl:variable>
            <xsl:if test="$t != 'pass'">
                <xsl:break select="$t"/>
            </xsl:if>
        </xsl:iterate>
    </xsl:template>
    
    <xsl:template match="c:any-of" mode="expects-error" as="xs:string">
        <xsl:iterate select="*">
            <xsl:param name="result" as="xs:string" select="'fail'"/>
            <xsl:on-completion select="$result"/>
            <xsl:variable name="t" as="xs:string">
                <xsl:apply-templates select="." mode="#current"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$t = 'pass'">
                    <xsl:break select="$t"/>
                </xsl:when>
                <xsl:when test="starts-with($t, 'wrong-error')">
                    <xsl:next-iteration>
                        <xsl:with-param name="result" select="$t"/>
                    </xsl:next-iteration>
                </xsl:when>
            </xsl:choose>
        </xsl:iterate>
    </xsl:template>

    <!-- These templates are deliberately set namespace-neutral as the QT3 tests and the XSLT tests are defined
    in different namespaces -->

    <xsl:variable name="debug-assert" as="xs:boolean" select="true()" static="true"/>
    
    <xsl:mode name="check-result" on-no-match="fail">
        <!-- This mode is applied to assertion elements (children of c:result) when the result of the transformation
            is success. The result is a boolean: true if the test passes, false if it fails. 
            Two tunnel parameters are passed: $outcome is a map holding the entire transformation result (in the
            format of the result map returned by fn:transform(), and $result is the value of $outcome?output,
            except when processing secondary results, when it is the appropriate secondary result document.
        -->
    </xsl:mode>

    <!-- TODO - collect and check messages -->
    
    <xsl:template match="c:error | c:assert-serialization-error" mode="check-result" as="xs:boolean">
        <xsl:sequence select="false()"/>
    </xsl:template>
    
    <xsl:template match="c:serialization-matches" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:sequence select="matches($result, string(.), string(@flags))"/>
    </xsl:template>
    
    <xsl:template match="c:assert-serialization" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="required" select="if (@file) then translate(unparsed-text(resolve-uri(@file, base-uri(.))), '&#xd;', '') else string(.)"/>
        <xsl:if test="$result ne $required">
            <xsl:message>REQUIRED: {string-to-codepoints($required)}</xsl:message>
            <xsl:message>ACTUAL:   {string-to-codepoints($result)}</xsl:message>
        </xsl:if>
        <xsl:sequence select="$result eq $required"/>
    </xsl:template>

    <xsl:template match="c:assert-message" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <!-- Message output cannot be tested without vendor extensions -->
        <xsl:sequence select="true()"/>
    </xsl:template>
    
    <xsl:template match="c:assert-warning" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <!-- Warning output cannot be tested without vendor extensions -->
        <xsl:sequence select="true()"/>
    </xsl:template>
    
    <xsl:template match="c:result" mode="check-result" as="item()*">
        <xsl:apply-templates select="*" mode="#current"/>
    </xsl:template>
    
    <xsl:template match="c:all-of" mode="check-result" as="xs:boolean">
        <xsl:iterate select="*">
            <xsl:on-completion select="true()"/>
            <xsl:variable name="r" as="xs:boolean">
                <xsl:apply-templates select="." mode="#current"/>
            </xsl:variable>
            <xsl:if test="not($r)">
                <xsl:break select="false()"/>
            </xsl:if>
        </xsl:iterate>
    </xsl:template>
    
    <xsl:template match="c:any-of" mode="check-result" as="xs:boolean">
        <xsl:iterate select="*">
            <xsl:on-completion select="false()"/>
            <xsl:variable name="r" as="xs:boolean">
                <xsl:apply-templates select="." mode="#current"/>
            </xsl:variable>
            <xsl:if test="$r">
                <xsl:break select="true()"/>
            </xsl:if>
        </xsl:iterate>
    </xsl:template>
    
    <xsl:template match="c:not" mode="check-result" as="xs:boolean">
        <xsl:variable name="r" as="xs:boolean">
            <xsl:apply-templates select="*" mode="#current"/>
        </xsl:variable>
        <xsl:sequence select="not($r)"/>
    </xsl:template>

    <xsl:template match="c:assert-result-document" mode="check-result" as="xs:boolean">
        <xsl:param name="outcome" tunnel="yes"/>
        <xsl:param name="namespaces" as="element()?" tunnel="yes"/>
        <xsl:variable name="absolute-uri" select="string(resolve-uri(ancestor::c:test-case/@name || '/' || @uri, $base-output-dir))"/>
        <xsl:choose>
            <xsl:when test="$outcome($absolute-uri)">
                <xsl:apply-templates select="*" mode="#current">
                    <xsl:with-param name="result" tunnel="yes" select="$outcome($absolute-uri)"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>No result document for URI {$absolute-uri}</xsl:message>
                <xsl:sequence select="false()"/>
            </xsl:otherwise>
        </xsl:choose>       
    </xsl:template>

    <xsl:template match="c:assert" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:param name="namespaces" as="element()?" tunnel="yes"/>

        <xsl:try>
            <xsl:variable name="nsContext" as="element()">
                <xsl:variable name="me" select="."/>
                <nsContext>
                    <xsl:for-each select="in-scope-prefixes(.)[matches(., '\i')]">
                        <xsl:attribute name="{.}:dummy" namespace="{namespace-uri-for-prefix(.,$me)}"/>
                    </xsl:for-each>
                    <xsl:sequence select="$namespaces/@*"/>
                </nsContext>
            </xsl:variable>
            <xsl:variable name="empty-doc" as="document-node()">
                <xsl:document/>
            </xsl:variable>
            <xsl:variable name="assertion" as="item()*">
                <xsl:evaluate xpath="string(.)"
                    context-item="
                        if (empty($result)) then
                            $empty-doc
                        else
                            if (count($result) gt 1) then
                                ()
                            else
                                $result"
                    with-params="map{ xs:QName('result'):$result}" 
                    namespace-context="$nsContext" 
                    xpath-default-namespace=""
                    schema-aware="yes"
                    saxon:allow-any-schema-namespace="yes"
                    xmlns:saxon="http://saxon.sf.net/"/>
            </xsl:variable>
            <xsl:if test="not($assertion)">
                <xsl:message select="'FAILED ASSERT: {', string(.), '}'" use-when="$debug-assert"/>
            </xsl:if>
            <xsl:sequence select="boolean($assertion)"/>
            <xsl:catch>
                <xsl:message select="'Failure during assert:', string(.), ':', $err:code, $err:description"/>
                <xsl:sequence select="false()"/>
            </xsl:catch>
        </xsl:try>
    </xsl:template>
    
    <xsl:template match="c:assert-true" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:sequence select="$result instance of xs:boolean and $result"/>
    </xsl:template>
    
    <xsl:template match="c:assert-false" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:sequence select="$result instance of xs:boolean and not($result)"/>
    </xsl:template>
    
    <xsl:template match="c:assert-empty" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:sequence select="empty($result)"/>
    </xsl:template>
    
    <xsl:template match="c:assert-count" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:sequence select="count($result) = number(.)"/>
    </xsl:template>
    
    <xsl:template match="c:assert-string-value" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="isXSLT" select="namespace-uri() = 'http://www.w3.org/2012/10/xslt-test-catalog'"/>
        <xsl:variable name="normalize" select="$isXSLT or @normalize-space = 'true'"/>
        <xsl:variable name="expected"
            select="
                if ($normalize) then
                    normalize-space(.)
                else
                    ."/>
        <xsl:variable name="expected" select="replace($expected,'&amp;','&amp;amp;')"/>
        <xsl:variable name="result.string"
            select="
                if ($normalize) then
                    normalize-space(string-join($result, ' '))
                else
                    if ($result instance of xs:string) then
                        $result
                    else
                        replace(serialize(string-join($result, ' ')), '^&quot;|&quot;$', '')"/>
        <xsl:message
            select="$result.string = $expected, '&#xA;result.string=|', string-to-codepoints($result.string), '|&#xA;     expected=|', string-to-codepoints($expected), '|'"/>
        <xsl:sequence select="not($result instance of element(err:ERROR)) and $result.string = $expected"/>
    </xsl:template>
    
    <xsl:template match="c:assert-eq" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:variable name="expected" as="item()*">
            <xsl:evaluate xpath="string(.)" context-item="()" with-params="map{ }"/>
        </xsl:variable>
        <!--<xsl:try>
            <xsl:sequence
                select="not($result instance of element(err:ERROR)) and $expected = $result"/>
            <xsl:catch>
                <xsl:sequence select="false()"/>
            </xsl:catch>
        </xsl:try>-->
        <!-- <xsl:message select="'EXPECTED:',$expected,'RESULT:',$result"/>-->
        <xsl:sequence select="not($result instance of element(err:ERROR)) and $result = $expected"/>
    </xsl:template>

    <xsl:template match="c:assert-permutation" mode="check-result" as="item()?">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="expected" as="item()*">
            <xsl:evaluate xpath="string(.)" context-item="()" with-params="map{ }"/>
        </xsl:variable>
        <xsl:try>
            <xsl:sequence
                select="
                    not($result instance of element(err:ERROR))
                    and (count($expected) = count($result))
                    and (every $e in $expected
                        satisfies (some $r in $result
                            satisfies deep-equal($e, $r)))
                    and (every $r in $result
                        satisfies (some $e in $expected
                            satisfies deep-equal($e, $r)))"/>
            <xsl:catch>
                <err:WRONG-ERROR should-be="none" code="DRIVER-FAILURE" reason="Error in processing assert-permutation"/>
            </xsl:catch>
        </xsl:try>
        <!--<xsl:sequence select="not($result instance of element(err:ERROR)) and $result = $expected"/>-->
    </xsl:template>
    
    <xsl:template match="c:assert-deep-eq" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="expected" as="item()*">
            <xsl:try>
                <xsl:evaluate xpath="string(.)" context-item="()" with-params="map{ }"/>
                <xsl:catch>
                    <xsl:message select="'Error in evaluation of deep-equal assertion:' || string(.)"/>
                </xsl:catch>
            </xsl:try>
        </xsl:variable>
        <!-- <xsl:message select="'EXPECTED:',$expected"/>
        <xsl:message select="'RESULT:',$result"/>-->
        <xsl:sequence select="not($result instance of element(err:ERROR)) and deep-equal($result, $expected)"/>
    </xsl:template>
    
    <xsl:template match="c:assert-xml" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:param name="debug" as="xs:boolean" select="false()" tunnel="yes"/>
        <xsl:variable name="ignore-prefixes" as="xs:boolean" select="@ignore-prefixes = 'true'"/>
 
        <xsl:variable name="expected.doc" as="item()*">
            <xsl:try>
                <xsl:sequence select="
                    if (@file) 
                    then doc(resolve-uri(@file, base-uri(.))) 
                    else parse-xml(string(.))"/>
                <xsl:catch>
                    <xsl:message select="'XML error in recovering assertion comparison'"/>
                    <xsl:message select="$err:code, $err:description"/>
                    <failed-to-parse-expected-result/>
                </xsl:catch>
            </xsl:try>
        </xsl:variable>
        <xsl:variable name="flags" select="'' || 'F'[not($ignore-prefixes)]"/> <!-- chosen for compatibility with saxon:deep-equal() -->
        <xsl:variable name="comparison" select="d:compare($result, $expected.doc, $flags)"/>
        <xsl:choose>
            <xsl:when test="exists($comparison//d:DIFFERENCE)">
                <xsl:message>RESULTS DIFFER</xsl:message>
                <xsl:message select="$comparison"/>
                <xsl:message select="'EXPECTED:&#xA;', $expected.doc" use-when="$debug-assert"/>
                <xsl:sequence select="false()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="true()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
 
    <xsl:template match="*:assert-type" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:evaluate xpath="'$result instance of ' || .">
            <xsl:with-param name="result" select="$result"/>
        </xsl:evaluate>
    </xsl:template>

    <xsl:template match="*:error" mode="check-result" as="xs:boolean">
        <xsl:sequence select="false()"/>
    </xsl:template>
    
</xsl:stylesheet>
