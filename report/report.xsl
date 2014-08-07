<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:f="http://myfunction"
    xmlns:q="http://www.w3.org/2014/05/test-report" xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="xs math f"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog" version="3.0">

    <xsl:mode name="cat" on-no-match="shallow-skip"/>
    <xsl:mode name="cat-set" on-no-match="shallow-skip"/>
    <xsl:mode name="query" on-no-match="shallow-skip"/>

    <xsl:output indent="yes" saxon:line-length="200"
        saxon:attribute-order="name total-count soft-count description instruction"/>

    <xsl:param name="testlocation" select="'file:///D:/Projects/W3.org/XT3'"/>

    <xsl:param name="testcat" select="$testlocation || '/catalog.xml'"/>

    <xsl:variable name="queries" as="element()*">
        <!-- attr -->
        <q:set name="as" description="Type requirements (as-attribute)" by-attribute="as">
            <q:query group-by="parent-name"/>
        </q:set>

        <q:query setname="avt" name="Attribute value templates">//@*[contains(., '{') or contains(.,
            '}')]</q:query>

        <q:set name="expand-text" description="CVT expand-text" by-attribute="expand-text">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="match" description="Matching templates" by-attribute="match">
            <q:query group-by="parent-name"/>
        </q:set>

        <q:set name="mode" description="Modes (XSLT 2.0)" by-attribute="mode">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="select" description="Select attribute" by-attribute="select">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="select" description="Separator attribute" by-attribute="separator">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="streamable" description="Streamable attribute" by-attribute="streamable">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="strip-type-annotations" description="Strip type annotations"
            by-attribute="input-type-annotations">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="tunnel" description="Tunnel parameters" by-attribute="tunnel">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="use-when" description="use-when attribute" by-attribute="use-when">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="validation" description="Validation attribute" by-attribute="validation">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="version" description="Version attribute" by-attribute="version">
            <q:query group-by="parent-name"/>
        </q:set>
        <q:set name="xpath-default-namespace" description="XPath default namespace attribute"
            by-attribute="xpath-default-namespace">
            <q:query group-by="parent-name"/>
        </q:set>

        <!-- streaming functions -->
        <q:set name="sf-avg" description="Streaming: averaging" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-boolean" description="Streaming: boolean" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-outermost" description="Streaming: outermost" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-one-or-more" description="Streaming: one-or-more" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-reverse" description="Streaming: reverse function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-codepoints-to-string" description="Streaming: codepoints-to-string function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-count" description="Streaming: count function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-deep-equal" description="Streaming: deep-equal function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-distinct-values" description="Streaming: distinct-values function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-empty" description="Streaming: empty function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-exactly-one" description="Streaming: exactly-one function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-exists" description="Streaming: exists function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-filter" description="Streaming: filter function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-fold-left" description="Streaming: fold-left function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-fold-right" description="Streaming: fold-right function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-head" description="Streaming: head function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-index-of" description="Streaming: index-of function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-innermost" description="Streaming: innermost function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-insert-before" description="Streaming: insert-before function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-map-new" description="Streaming: map-new function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-max" description="Streaming: max function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-min" description="Streaming: min function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-not" description="Streaming: not function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-one-or-more" description="Streaming: one-or-more function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-outermost" description="Streaming: outermost function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-remove" description="Streaming: remove function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-string-join" description="Streaming: string-join function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-subsequence" description="Streaming: subsequence function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-sum" description="Streaming: sum function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-tail" description="Streaming: tail function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-trace" description="Streaming: trace function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-unordered" description="Streaming: unordered function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        <q:set name="sf-zero-or-one" description="Streaming: zero-or-one function" by-instruction="stream">
            <q:query group-by="function" />
        </q:set>
        
        <!-- declarations -->
        <q:set name="accumulator" description="Declaration xsl:accumulator (XSLT 3.0)"
            by-instruction="accumulator">
            <q:query group-by="function" />
        </q:set>
        <q:set name="attribute-set" description="Declaration xsl:attribute-set"
            by-instruction="attribute-set">
            <q:query group-by="function" />
        </q:set>
        <q:set name="character-map" description="Declaration xsl:character-map"
            by-instruction="character-map"/>
        <q:set name="function" description="Declaration xsl:function" by-instruction="function"/>
        <q:set name="import" description="Declaration xsl:import" by-instruction="import"/>
        <q:set name="import-schema" description="Declaration xsl:import-schema"
            by-instruction="import-schema"/>
        <q:set name="include" description="Declaration xsl:include" by-instruction="include"/>
        <q:set name="mode" description="Declaration xsl:mode (XSLT 3.0)" by-instruction="mode"/>
        <q:set name="namespace-alias" description="Declaration xsl:namespace-alias"
            by-instruction="namespace-alias"/>
        <q:set name="output" description="Declaration xsl:output" by-instruction="output"/>
        <q:set name="override" description="Declaration xsl:override (XSLT 3.0)"
            by-instruction="override"/>
        <q:set name="package" description="Declaration xsl:package (XSLT 3.0)"
            by-instruction="package"/>
        <q:set name="param" description="Declaration xsl:param" by-instruction="param"/>
        <q:set name="template" description="Declaration xsl:template" by-instruction="template"/>
        <q:set name="use-package" description="Declaration xsl:use-package (XSLT 3.0)"
            by-instruction="use-package"/>
        <q:set name="variable" description="Declaration xsl:variable" by-instruction="variable"/>

        <!-- instructions -->
        <q:set name="analyze-string" description="Instruction xsl:analyze-string"
            by-instruction="analyze-string"/>
        <q:set name="apply-templates" description="Instruction xsl:apply-templates"
            by-instruction="apply-templates"/>
        <q:set name="assert" description="Instruction xsl:assert" by-instruction="assert"/>
        <q:set name="attribute" description="Instruction xsl:attribute" by-instruction="attribute"/>
        <q:set name="call-template" description="Instruction xsl:call-template"
            by-instruction="call-template"/>
        <q:set name="choose" description="Instruction xsl:choose" by-instruction="choose"/>
        <q:set name="construct-node" description="Node construction" by-lre="true"/>
        <q:set name="copy" description="Instruction xsl:copy" by-instruction="copy"/>
        <q:set name="element" description="Instruction xsl:element" by-instruction="element"/>
        <q:set name="evaluate" description="Instruction xsl:evaluate" by-instruction="evaluate"/>
        <q:set name="for-each-group" description="Instruction xsl:for-each-group"
            by-instruction="for-each-group"/>
        <!--q:set name="iterate" description="Instruction xsl:iterate" by-instruction="iterate"/-->
        <q:set name="lre" description="Literal result elements" by-lre="true"/>
        <q:set name="merge" description="Instruction xsl:merge" by-instruction="merge"/>
        <q:set name="message" description="Instruction xsl:message" by-instruction="message"/>
        <q:set name="next-match" description="Instruction xsl:next-match"
            by-instruction="next-match"/>
        <q:set name="number" description="Instruction xsl:number" by-instruction="number"/>
        <q:set name="result-document" description="Instruction xsl:result-document"
            by-instruction="result-document"/>
        <q:set name="sequence" description="Instruction xsl:sequence" by-instruction="sequence"/>
        <q:set name="sort" description="Instruction xsl:sort" by-instruction="sort"/>
        <q:set name="stream" description="Instruction xsl:stream" by-instruction="stream"/>
        <q:set name="try" description="Instruction xsl:try" by-instruction="try"/>
        <q:set name="xsl-document" description="Instruction xsl:document" by-instruction="document"
        />
    </xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates select="doc($testcat)" mode="cat"/>
    </xsl:template>

    <xsl:template match="*" mode="cat">
        <report>
            <xsl:apply-templates mode="#current"/>
        </report>
    </xsl:template>

    <!-- start processing test set -->
    <xsl:template match="test-set" mode="cat">
        <xsl:apply-templates select="doc($testlocation || '/' || @file)" mode="cat-set"/>
    </xsl:template>

    <xsl:template match="test-set" mode="cat-set">
        <xsl:variable name="tests" as="element()">
            <tests category="{/*/@name}">
                <xsl:attribute name="xsluris">
                    <xsl:value-of
                        select="test-case/test/stylesheet/@file/string(resolve-uri(., base-uri(.))),
                        environment/stylesheet/@file/string(resolve-uri(., base-uri(.)))"
                    />
                </xsl:attribute>
                <xsl:attribute name="total-count" select="count(test-case)"/>
            </tests>
        </xsl:variable>

        <xsl:apply-templates select="$queries" mode="query">
            <xsl:with-param name="tests" select="$tests"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="q:set[@by-attribute]" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="set" select="."/>

        <!-- count query in each xsl document -->
        <xsl:variable name="countseq" as="xs:integer*"
            select="count(f:getdocs($tests, $set)//*[f:query-by-attrib(., current())])"/>

        <xsl:if test="sum($countseq) gt 0">
            <category attribute="{@by-attribute}" total-count="{$tests/@total-count}">
                <xsl:attribute name="name" select="@name"/>
                <xsl:copy-of select="@description"/>
                <xsl:attribute name="soft-count" select="sum($countseq)"/>

                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="tests" select="$tests"/>
                </xsl:apply-templates>
            </category>
        </xsl:if>
    </xsl:template>


    <xsl:template match="q:set[@by-instruction]" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="set" select="."/>

        <!-- count query in each xsl document -->
        <xsl:variable name="countseq" as="xs:integer*"
            select="count(f:getdocs($tests, $set)//*[f:query-by-instruction(., current())])"/>

        <xsl:if test="sum($countseq) gt 0">
            <category instruction="{@by-instruction}" total-count="{$tests/@total-count}">
                <xsl:attribute name="name" select="@name"/>
                <xsl:copy-of select="@description"/>
                <xsl:attribute name="soft-count" select="sum($countseq)"/>
                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="tests" select="$tests"/>
                </xsl:apply-templates>
            </category>
        </xsl:if>
    </xsl:template>

    <xsl:template match="q:query[@group-by='parent-name']" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="q-set" select="current()/.."/>
        <xsl:variable name="xsldocs" select="f:getdocs($tests, current()/..)"/>
        <xsl:variable name="instructions"
            select="
            for $doc in $xsldocs 
            return $doc//*[f:query-by-attrib(., $q-set)]
                /QName(namespace-uri(.), local-name(.))"/>

        <!-- count per instruction -->
        <xsl:for-each
            select="distinct-values($instructions[namespace-uri-from-QName(.) = 'http://www.w3.org/1999/XSL/Transform'])">
            <instruction name="xsl:{.}">
                <xsl:attribute name="soft-count"
                    select="count($xsldocs//*[local-name() = local-name-from-QName(current())][f:query-by-attrib(., $q-set)])"
                />
            </instruction>
        </xsl:for-each>

        <!-- count per LRE -->
        <xsl:for-each select="distinct-values($instructions[namespace-uri-from-QName(.) = ''])">
            <literal-result-element name="{.}">
                <xsl:attribute name="soft-count"
                    select="count($xsldocs//*[local-name() = local-name-from-QName(current())][f:query-by-attrib(., $q-set)])"
                />
            </literal-result-element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="q:query[@group-by='function']" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="q-set" select="current()/.."/>
        <xsl:variable name="xsldocs" select="f:getdocs($tests, current()/..)"/>

        <xsl:variable name="function-names" as="xs:string*">
            <xsl:for-each select="$xsldocs//@*">
                <xsl:analyze-string select="." regex="([-a-z0-9:]+ *)\(">
                    <xsl:matching-substring>
                        <xsl:sequence select="regex-group(1)"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:for-each>
        </xsl:variable>

        <!-- count per instruction -->
        <xsl:for-each select="distinct-values($function-names)">
            <function name="{.}" soft-count="{count($function-names[. = current()])}" />
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="f:getdocs" as="document-node()*">
        <xsl:param name="tests"/>
        <xsl:param name="set"/>
        <xsl:copy-of select="document(tokenize($tests/@category[. = $set/@name]/../@xsluris, ' '))"
        />
    </xsl:function>

    <xsl:function name="f:query-by-attrib" as="xs:boolean">
        <xsl:param name="n"/>
        <xsl:param name="q-set"/>
        <xsl:sequence select="not(empty($n[@*[local-name() = $q-set/@by-attribute]]))"/>
    </xsl:function>

    <xsl:function name="f:query-by-instruction" as="xs:boolean">
        <xsl:param name="n"/>
        <xsl:param name="q-set"/>
        <xsl:sequence select="not(empty($n[self::*[local-name() = $q-set/@by-instruction]]))"/>
    </xsl:function>

</xsl:stylesheet>
