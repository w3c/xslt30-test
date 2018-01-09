<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT" xmlns:xp="http://saxonica.com/xpathParse" xmlns:X="XLST" xmlns:p="CR-xpath-30-20130108"
    xmlns:doc="http://www.saxonica.com/ns/documentation" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:saxon="http://saxon.sf.net/" xmlns:H="http://www.w3.org/1999/xhtml"
    xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:q="http://www.w3.org/2010/09/qt-fots-catalog"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs doc dc p saxon err map q H xp xsl ixsl" version="3.0" expand-text="yes"
    xpath-default-namespace="http://www.w3.org/2010/09/qt-fots-catalog">


    <!-- These templates are deliberately set namespace-neutral as the QT3 tests and the XSLT tests are defined
    in different namespaces -->

    <xsl:variable name="debug-assert" as="xs:boolean" select="true()" static="true"/>

    <!-- TODO - collect and check messages -->
    <xsl:template match="*:serialization-matches | *:assert-serialization" mode="check-result" as="item()?">
        <xsl:sequence select="true()"/>
    </xsl:template>

    <xsl:template match="*:assert-message" mode="check-result" as="item()?">
        <xsl:param name="result" tunnel="yes"/>
<!--        <xsl:message select="'MESSAGES:',serialize($result?messages)"></xsl:message>-->
        <xsl:apply-templates select="*" mode="#current">
            <xsl:with-param name="result" select="
            if ($result instance of map(*)) then
            $result?messages
            else
            $result" tunnel="true"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="*:result" mode="check-result" as="item()*">
        <xsl:apply-templates select="*" mode="#current"/>
    </xsl:template>
    <xsl:template match="*:all-of" mode="check-result" as="item()?">
        <xsl:variable name="subtests" as="item()*">
            <xsl:apply-templates select="*" mode="#current"/>
        </xsl:variable>
        <!-- <xsl:message select="'subtests:', serialize($subtests)"/>-->
        <xsl:variable name="wrong-error" select="($subtests[. instance of element(err:WRONG-ERROR)])[1]"/>
        <xsl:sequence
            select="
                if (every $t in $subtests
                    satisfies ($t instance of xs:boolean and $t)) then
                    true()
                else
                    if (exists($wrong-error)) then
                        $wrong-error
                    else
                        false()"
        />
    </xsl:template>
    <xsl:template match="*:any-of" mode="check-result" as="item()?">
        <xsl:variable name="subtests" as="item()*">
            <xsl:apply-templates select="*" mode="#current"/>
        </xsl:variable>
        <!-- <xsl:message select="'subtests:', serialize($subtests)"/>-->
        <xsl:variable name="wrong-error" select="($subtests[. instance of element(err:WRONG-ERROR)])[1]"/>
        <xsl:sequence
            select="
                if (some $t in $subtests
                    satisfies ($t instance of xs:boolean and $t)) then
                    true()
                else
                    if (exists($wrong-error)) then
                        $wrong-error
                    else
                        false()"
        />
    </xsl:template>

    <xsl:template match="*:assert-result-document" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:param name="namespaces" as="element()?" tunnel="yes"/>
        <xsl:apply-templates select="*" mode="#current">
            <xsl:with-param name="result"
                select="
                    if ($result instance of map(*)) then
                        $result(@uri)
                    else
                        $result" tunnel="true"
            />
        </xsl:apply-templates>

    </xsl:template>

    <xsl:template match="*:assert" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:param name="namespaces" as="element()?" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$result?error-code">
                <xsl:sequence select="false()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="result" select="$result?output"/>
                <xsl:try>
                    <!--<xsl:message select="'RESULT:', serialize($result)"/>
                    <xsl:message
                        select="'RESULT text-nodes:', $result//text() ! ('&#xA;' || . || '|')"/>-->
                    <xsl:variable name="nsContext" as="element()">
                        <xsl:variable name="me" select="."/>
                        <nsContext>
                            <xsl:for-each select="in-scope-prefixes(.)[matches(., '\i')]">
                                <xsl:attribute name="{.}:dummy" namespace="{namespace-uri-for-prefix(.,$me)}"/>
                            </xsl:for-each>
                            <xsl:sequence select="$namespaces/@*"/>
                        </nsContext>
                    </xsl:variable>
                    <xsl:message select="'RESULT :', serialize($result)" use-when="$debug-assert"/>
                    <xsl:message select="'RESULT document-node()?:', $result instance of document-node()" use-when="$debug-assert"/>
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
                            with-params="map{ xs:QName('result'):$result}" namespace-context="$nsContext" xpath-default-namespace=""/>
                    </xsl:variable>
                    <xsl:message select="'TEST RESULT:', string(.), boolean($assertion)" use-when="$debug-assert"/>
                    <xsl:sequence select="boolean($assertion)"/>
                    <xsl:catch>
                        <xsl:message select="'Failure during assert:', string(.), ':', $err:code, $err:description"/>
                        <xsl:sequence select="false()"/>
                    </xsl:catch>
                </xsl:try>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*:assert-true" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:sequence select="$result instance of xs:boolean and $result"/>
    </xsl:template>
    <xsl:template match="*:assert-false" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:sequence select="$result instance of xs:boolean and not($result)"/>
    </xsl:template>
    <xsl:template match="*:assert-empty" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:sequence select="not($result instance of element(err:ERROR)) and empty($result)"/>
    </xsl:template>
    <xsl:template match="*:assert-count" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:sequence select="not($result instance of element(err:ERROR)) and count($result) = number(.)"/>
    </xsl:template>
    <xsl:template match="*:assert-string-value" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
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
    <xsl:template match="*:assert-eq" mode="check-result" as="xs:boolean">
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

    <xsl:template match="*:assert-permutation" mode="check-result" as="item()?">
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
    <xsl:template match="*:assert-deep-eq" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
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
    <!-- These XML assertion tests try all sorts of ways to find it they are equal - will cause problems with serialisation tests -->
    <xsl:template match="*:assert-xml" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:param name="debug" as="xs:boolean" select="false()" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:variable name="ignore-prefixes" as="xs:boolean" select="@ignore-prefixes = 'true'"/>
        <xsl:variable name="expected.string" as="item()*"
            select="
                if (@file) then
                    unparsed-text(resolve-uri(@file, base-uri(.)))
                else
                    let $r := replace(string(.), '&lt;!\[CDATA\[|\]\]&gt;', '')
                    return
                        if ($ignore-prefixes) then
                            replace($r, '\s*xmlns(:\i\c*)?=&quot;[^&quot;]*&quot;', '') ! replace(., '\i\c*:', '')
                        else
                            $r"/>
        <xsl:message select="'EXPECTED:&#xA;', $expected.string" use-when="$debug-assert"/>
        <!-- Remove:
            CR and trailing newline
        -->
        <xsl:variable name="expected.string" as="xs:string"
            select="replace($expected.string, '&gt;\s+&lt;', '&gt;&lt;') => replace('\r|\n$', '') => replace('&lt;\?xml version=&quot;1.0&quot; encoding=&quot;(UTF|utf)-8&quot;\?>', '')"/>
        <xsl:variable name="expected.doc" as="item()*">
            <xsl:try>
                <xsl:sequence
                    select="
                        if (@file) then
                            doc(resolve-uri(@file, base-uri(.)))
                        else
                            parse-xml($expected.string)"/>
                <xsl:catch>
                    <xsl:message select="'XML error in recovering assertion comparison'"/>
                    <!-- TODO - just a quick check -->
                    <xsl:sequence select="$expected.string"/>
                </xsl:catch>
            </xsl:try>
        </xsl:variable>
        <xsl:message select="'EXPECTED DOC:&#xA;', serialize($expected.doc)" use-when="$debug-assert"/>
        <xsl:variable name="result" as="item()*">
            <xsl:choose>
                <xsl:when test="$ignore-prefixes">
                    <xsl:apply-templates select="$result" mode="ignore-prefixes"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$result"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="result.serialized"
            select="
                string-join(for $r in $result
                return
                    serialize($r), '')"/>
        <xsl:message select="'Rawserialized:&#xA;', string-to-codepoints($result.serialized)" use-when="$debug-assert"/>
        <xsl:variable name="result.serialized" as="xs:string"
            select="replace($result.serialized, '&gt;\s+&lt;', '&gt;&lt;') ! replace(., '^&quot;?\s+|\s+$|&quot;$', '')"/>

        <xsl:variable name="text.equal" select="$result.serialized = $expected.string"/>
        <!-- TODO more accurate namespace checking -->
        <xsl:if test="string-length($expected.string) gt 4">
            <xsl:message select="'EXPECTED:&#xA;', $expected.string" use-when="$debug-assert"/>
            <xsl:message select="'RESULT  :&#xA;', $result.serialized" use-when="$debug-assert"/>
            <xsl:message
                select="'Equal:', $result.serialized = $expected.string, $text.equal, 'lengths:', string-length($expected.string), string-length($result.serialized)"
                use-when="$debug-assert"/>
            <xsl:message
                select="'Codepoints:', 'EXPECTED:&#xA;', string-to-codepoints($expected.string), 'RESULT  :&#xA;', string-to-codepoints($result.serialized)"
                use-when="$debug-assert"/>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="$result instance of element(err:ERROR)">
                <xsl:sequence select="false()"/>
            </xsl:when>
            <xsl:when
                test="exists($expected.doc) and $expected.doc instance of node() and $result instance of node() and (deep-equal($result, $expected.doc) or deep-equal($result/*, $expected.doc/*))">
                <!--<xsl:message select="'Returning true'"/>-->
                <xsl:sequence select="true()"/>
            </xsl:when>
            <xsl:when test="$text.equal">
                <!--<xsl:message select="'Returning true'"/>-->
                <xsl:sequence select="true()"/>
            </xsl:when>
            <xsl:when test="$result.serialized = $expected.string">
                <!--<xsl:message select="'Returning true'"/>-->
                <xsl:sequence select="true()"/>
            </xsl:when>
            <xsl:when test="deep-equal($result, $expected.doc)">
                <!--<xsl:message select="'Returning true'"/>-->
                <xsl:sequence select="true()"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- <xsl:message select="'Checking XML'"/>-->
                <xsl:variable name="expected" as="item()*">
                    <!--<xsl:for-each select="parse-xml($expected.string)/*">-->
                    <xsl:for-each
                        select="
                            if (starts-with($expected.string, '&lt;?xml')) then
                                parse-xml($expected.string)
                            else
                                parse-xml('&lt;A&gt;' || $expected.string || '&lt;/A&gt;')/*/*">
                        <xsl:choose>
                            <xsl:when test="$ignore-prefixes">
                                <xsl:apply-templates select="." mode="ignore-prefixes"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:if test="true() or $debug">
                    <xsl:message select="name(.), '&#xa; result :', serialize($result), '&#xa; expected :', serialize($expected)"
                        use-when="$debug-assert"/>
                </xsl:if>
                <xsl:sequence
                    select="
                        deep-equal(if ($result instance of document-node()) then
                            $result/*
                        else
                            $result, $expected)"
                />
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>
    <xsl:template match="*:assert-xmlSER" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="ignore-prefixes" as="xs:boolean" select="@ignore-prefixes = 'true'"/>
        <xsl:variable name="expected" as="item()*"
            select="
                let $r := string(.)
                return
                    if ($ignore-prefixes) then
                        replace($r, '\s*xmlns(:\i\c*)?=&quot;[^&quot;]*&quot;', '') ! replace(., '\i\c*:', '')
                    else
                        $r"/>
        <xsl:variable name="result" as="item()*">
            <xsl:choose>
                <xsl:when test="$ignore-prefixes">
                    <xsl:apply-templates select="$result" mode="ignore-prefixes"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$result"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- TODO more accurate namespace checking -->
        <xsl:variable name="serialized.result"
            select="
            string-join(for $r in $result
            return
            serialize($r,map{'indent':false()}) ! replace(., '&gt;\s+&lt;', '&gt;&lt;') ! replace(., '\s+xmlns=&quot;&quot;', ''), '')"/>
        <!--  <xsl:message select="name(.), ' result :', $serialized.result,'&#xa; expected :', $expected"/>-->

        <xsl:sequence select="not($result instance of element(err:ERROR)) and $serialized.result = $expected"/>
    </xsl:template>
    <xsl:mode name="ignore-prefixes" on-no-match="shallow-copy"/>
    <xsl:template match="text()[not(matches(., '\S'))]" mode="ignore-prefixes"/>
    <!-- <xsl:template match="text()" mode="ignore-prefixes">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>-->
    <xsl:template match="*" mode="ignore-prefixes">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*, node()" mode="#current"/>
        </xsl:element>
    </xsl:template>
    <!-- <xsl:variable name="string.hierarchy">
        <xs:string>
            <xs:normalized-string>
                <xs:token>
                    <xs:NMTOKEN/>
                    <xs:Name>
                        <xs:NCName>
                            <xs:ID/>
                            <xs:IDREF/>
                            <xs:ENTITY/>
                        </xs:NCName>
                    </xs:Name>
                    <xs:language/>
                </xs:token>
            </xs:normalized-string>
        </xs:string>
        <xs:decimal>
            <xs:integer>
                <xs:nonPositiveInteger>
                    <xs:negativeInteger/>
                </xs:nonPositiveInteger>
                <xs:nonNegativeInteger>
                    <xs:positiveInteger/>
                    <xs:unsignedLong>
                        <xs:unsignedInt>
                            <xs:unsignedShort>
                                <xs:unsignedByte/>
                            </xs:unsignedShort>
                        </xs:unsignedInt>
                    </xs:unsignedLong>
                </xs:nonNegativeInteger>
                <xs:long>
                    <xs:int>
                        <xs:short>
                            <xs:byte/>
                        </xs:short>
                    </xs:int>
                </xs:long>
            </xs:integer>
        </xs:decimal>
    </xsl:variable>
    <xsl:function name="q:subtype" as="xs:boolean">
        <xsl:param name="subtype" as="xs:string"/>
        <xsl:param name="supertype" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$subtype = 'array(*)'">
                <xsl:message select="$supertype, ' comparing with ', $subtype"/>
                <xsl:sequence select="starts-with($supertype, 'array(')"/>
            </xsl:when>
            <xsl:when test="$supertype = 'array(*)'">
                <xsl:sequence select="starts-with($subtype, 'array(')"/>
            </xsl:when>
            <xsl:when test="$subtype = 'map(*)'">
                <xsl:message select="$supertype, ' comparing with ', $subtype"/>
                <xsl:sequence select="starts-with($supertype, 'map(')"/>
            </xsl:when>
            <xsl:when test="$supertype = 'map(*)'">
                <xsl:message select="$supertype, ' comparing with ', $subtype"/>
                <xsl:sequence select="starts-with($subtype, 'map(')"/>
            </xsl:when>
            <xsl:when test="$supertype = 'document-node()'">
                <xsl:sequence select="starts-with($subtype, 'document-node(')"/>
            </xsl:when>
            <xsl:when test="$supertype = 'element()'">
                <xsl:sequence select="starts-with($subtype, 'element(')"/>
            </xsl:when>
            <xsl:when test="$subtype = 'document-node()'">
                <xsl:sequence select="starts-with($supertype, 'document-node(')"/>
            </xsl:when>
            <xsl:when test="$subtype = 'element()'">
                <xsl:sequence select="starts-with($supertype, 'element(')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="t1" select="$string.hierarchy//*[name(.) = $supertype]"/>
                <xsl:sequence select="exists($t1/descendant-or-self::*[name(.) = $subtype])"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>-->

    <!-- This might be simplified by using xsl:evaluate? -->
    <xsl:template match="*:assert-type" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="result"
            select="
                if ($result instance of map(*)) then
                    $result?output
                else
                    $result"/>
        <xsl:evaluate xpath="'$result instance of ' || .">
            <xsl:with-param name="result" select="$result"/>
        </xsl:evaluate>
    </xsl:template>

    <xsl:template match="*:error" mode="check-result" as="xs:boolean">
        <xsl:param name="result" tunnel="yes"/>
        <xsl:variable name="code" select="$result?error-code"/>
        <xsl:choose>
            <xsl:when test="$result?error-code">
                <xsl:choose>
                    <xsl:when test="@code eq '*' or @code eq $code or substring-after($code, 'err:') eq @code">
                        <xsl:sequence select="true()"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message>
                            <err:WRONG-ERROR should-be="{@code}" code="{if(starts-with($code,'Q{')) then $code else substring-after($code, 'err:')}" />
                        </xsl:message>
                        <xsl:sequence select="$accept-wrong-error"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:param name="accept-wrong-error" select="true()"/>
</xsl:stylesheet>
