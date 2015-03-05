<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:f="http://myfunction"
    xmlns:q="http://www.w3.org/2014/05/test-report" xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="xs math f saxon"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog" version="3.0">

    <xsl:mode name="cat" on-no-match="shallow-skip"/>
    <xsl:mode name="cat-set" on-no-match="shallow-skip"/>
    <xsl:mode name="query" on-no-match="shallow-skip"/>

    <xsl:output indent="yes" saxon:line-length="200"
        saxon:attribute-order="test-set-name tests-in-test-set total-queried-stylesheets description instruction"/>

    <xsl:param name="testlocation" select="'file:///D:/Projects/AbraSoft/__HG-ALL__/Exselt/W3.Tests/_Test-Repository/XT3'"/>

    <xsl:param name="testcat" select="$testlocation || '/catalog.xml'"/>

    <xsl:variable name="queries-old" as="element()*">
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
        <q:set name="xsl-document" description="Instruction xsl:document" by-instruction="document" />
        
        <!-- other groupings -->
        <q:set name="mode" description="J.1 #2.a new xsl:mode declaration with streamable attribute" by-instruction="mode" >
            <q:query group-by="attribute" element-name="mode" />
        </q:set>
        <q:set name="mode-streamable" 
                description="J.1 #2.a. A mode may be declared to be streamable, and rules are given that constrain what the template rules in a streamable mode can do." 
                by-instruction="mode"
                filter-include="@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="mode" />
        </q:set>
        <q:set name="merge" description="J.1.a #2 new xsl:merge instruction" by-instruction="merge" >
            <q:query group-by="attribute" element-name="merge" />
        </q:set>
        <q:set name="merge" description="J.2 #2 new xsl:merge-source instruction" by-instruction="merge-source" >
            <q:query group-by="attribute" element-name="merge-source" />
        </q:set>
    </xsl:variable>

    <xsl:variable name="queries" as="element()*">
        <!-- other groupings -->
        <q:set name="package override use-package error" 
                group-by="package"
                description="Packages"
                spec="J.1 #01. A stylesheet may now consist of multiple packages."
                by-instruction="package">
            <q:query group-by="attribute-list" element-name="package" attributes="name package-version version input-type-annotations declared-modes default-mode default-validation default-collation extension-element-prefixes exclude-result-prefixes expand-text use-when xpath-default-namespaces"/>
        </q:set>
        
        <q:set name="package override use-package error" 
                group-by="package"
                description="Packages -- use-package"
                spec="J.1 #01. A stylesheet may now consist of multiple packages."
                by-instruction="use-package">
            <q:query group-by="attribute-list" element-name="use-package" attributes="name package-version"/>
        </q:set>
        
        <q:set name="package override use-package error" 
                group-by="package"
                description="Packages -- override"
                spec="J.1 #01. A stylesheet may now consist of multiple packages."
                by-instruction="override">
            <q:query group-by="instruction" element-name="template" parent="override"/>
            <q:query group-by="instruction" element-name="function" parent="override"/>
            <q:query group-by="instruction" element-name="accumulator" parent="override"/>
            <q:query group-by="instruction" element-name="variable" parent="override"/>
            <q:query group-by="instruction" element-name="param" parent="override"/>
            <q:query group-by="instruction" element-name="attribute-set" parent="override"/>
        </q:set>
        
        <!-- J.1 #2, modes -->
        
        <!-- TODO: fix for all streaming modes -->
        <q:set name="mode error" 
                group-by="mode streaming"
                description="Streamable modes"
                spec="J.1 #02.a. A mode may be declared to be streamable, and rules are given that constrain what the template rules in a streamable mode can do." 
                by-instruction="mode"
                filter-include="@streamable[. = 'yes']">
            <q:query group-by="attribute-list" element-name="mode" attributes="streamable" />
        </q:set>
        <q:set name="mode error"
                group-by="mode template-matching"
                description="Modes with warning-on-no-match, on-multiple-match and on-no-match"
                spec="J.1 #02.b. An xsl:mode declaration may define the action to be taken when there is no matching template rule, and the action to be taken when there are multiple matching template rules." 
                by-instruction="mode"
                filter-include="@warning-on-no-match | @on-multiple-match | @on-no-match">
            <q:query group-by="attribute-list" element-name="mode" attributes="warning-on-no-match on-multiple-match on-no-match" />
        </q:set>
        
        <q:set name="mode error"
                group-by="mode schema-aware"
                description="Typed modes"
                spec="J.1 #02.c. An xsl:mode declaration may indicate that the template rules in a given mode are designed to process typed (schema-validated) nodes only, or untyped nodes only. It may also indicate that element names appearing in match patterns for the mode are only to match elements in the source document that have been validated against the corresponding element declarations in the schema." 
                by-instruction="mode"
                filter-include="@typed">
            <q:query group-by="attribute-list" element-name="mode" attributes="typed" />
        </q:set>
        <q:set name="mode error" 
                group-by="mode"
                description="Default modes"
                spec="J.1 #02.d. A default mode can be declared for a stylesheet module, making it easier to reuse existing stylesheet modules to construct a composite stylesheet." 
                by-instruction="*">
            <q:query group-by="attribute-list" element-name="stylesheet" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="transform" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="package" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="template" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="function" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="lre" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="for-each" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="for-each-group" attributes="default-mode" />
            <q:query group-by="attribute-list" element-name="merge-action" attributes="default-mode" />
        </q:set>
        
        <!-- J.1 #3 streaming -->
        <q:setX name="*"
                group-by="streaming xsl:stream"
                description="xsl:stream instruction"
                spec="J.1 #03.a. The xsl:stream instruction is provided specifically to read and process an input document using streaming." 
                by-instruction="stream">
        </q:setX>
        
        <q:set name="iterate error si-group si-iterate"
                group-by="streaming iteration"
                description="xsl:iterate instruction"
                spec="J.1 #03.b. The xsl:iterate instruction allows iterative processing of a sequence, with the ability for the processing of one item to depend on the results of processing of previous items, and with the ability to terminate the iteration before all the items in the sequence have been processed." 
                by-instruction="iterate">
        </q:set>
                
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="xsl:merge instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge">
            <q:query group-by="attribute" element-name="merge" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="xsl:merge-source instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-source">
            <q:query group-by="attribute" element-name="merge-source" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="Streamable xsl:merge-key instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-key">
            <q:query group-by="attribute" element-name="merge-key" />
        </q:set>

        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="xsl:merge-action instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-action">
            <q:query group-by="attribute" element-name="merge-action" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="Streamable xsl:merge instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge"
                filter-include="xsl:merge-source/@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="merge" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="Streamable xsl:merge-source instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-source"
                filter-include="@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="merge-source" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="Streamable xsl:merge-action instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-action"
                filter-include="preceding-sibling::xsl:merge-source/@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="merge-action" />
        </q:set>
        
        <q:set name="merge error si-merge"
                group-by="streaming merging"
                description="Streamable xsl:merge-key instruction"
                spec="J.1 #03.c. The xsl:merge instruction allows several input sequences to be merged into a single output sequence, based on the value of a merge key." 
                by-instruction="merge-key"
                filter-include="../@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="merge-key" />
        </q:set>
        
        <!-- xsl:fork -->
        <q:set name="fork error si-fork"
                group-by="streaming forking"
                description="xsl:fork instruction"
                spec="J.1 #03.d. The xsl:fork instruction allows multiple results to be computed during a single pass of a streamed input document." 
                by-instruction="fork">
            <q:query group-by="instruction" element-name="for-each-group" />
            <q:query group-by="instruction" element-name="sequence" />
            <q:query group-by="instruction" element-name="fallback" />
        </q:set>
        
        <!-- xsl:accumulator -->
        <q:set name="accumulator error"
                group-by="accumulators"
                description="xsl:accumulator declaration"
                spec="J.1 #04.a. The new top-level declaration xsl:accumulator is introduced. An accumulator represents information about a node in a document that can be computed during a streamed pass over the document, starting at the start and ending at that node." 
                by-instruction="accumulator">
            <q:query group-by="attribute" element-name="accumulator" />
        </q:set>
        
        <q:set name="accumulator error"
                group-by="streaming accumulators"
                description="Streaming xsl:accumulator declaration"
                spec="J.1 #04.a. The new top-level declaration xsl:accumulator is introduced. An accumulator represents information about a node in a document that can be computed during a streamed pass over the document, starting at the start and ending at that node." 
                by-instruction="accumulator"
                filter-include="@streamable[. = 'yes']">
            <q:query group-by="attribute" element-name="accumulator" />
        </q:set>
        
        <q:set name="snapshot"
                group-by="snapshot function"
                description="fn:snapshot function"
                spec="J.1 #04.b. New functions copy-of and snapshot are provided, to enable streaming applications to operate in 'windowing' mode, where the input document is divided into a sequence of small subtrees processed one at a time." 
                by-function="snapshot">
             <q:query group-by="function" function-name="snapshot" />
        </q:set>
        
        <q:set name="copy-of match streamable si-copy-of"
                group-by="copy-of function"
                description="fn:copy-of function"
                spec="J.1 #04.b. New functions copy-of and snapshot are provided, to enable streaming applications to operate in 'windowing' mode, where the input document is divided into a sequence of small subtrees processed one at a time." 
                by-function="copy-of">
             <q:query group-by="function" function-name="copy-of" />
        </q:set>
        
        <!-- TODO: conditional content -->
        <q:set name="conditional"
                group-by="conditional-content"
                description="Conditional content"
                spec="J.1 #05.b. TODO: replaces xsl:on-empty / conditional-content." 
                by-instruction="conditional-content">
        </q:set>
        
        <!-- xsl:try/evaluate/assert -->
        <q:set name="try si-try evaluate mode assert error maps"
                group-by="xsl:try"
                description="Structured error handling"
                spec="J.1 #05.a. The xsl:try instruction allows recovery from dynamic errors." 
                by-instruction="try">
             <q:query group-by="attribute-list" element-name="try" attributes="select rollback-output" />
        </q:set>
        
        <q:set name="try si-try evaluate mode assert error maps"
                group-by="xsl:catch"
                description="Structured error handling"
                spec="J.1 #05.a. The xsl:try instruction allows recovery from dynamic errors." 
                by-instruction="try">
             <q:query group-by="attribute-list" element-name="catch"  attributes="select errors" />
        </q:set>
        
        <q:set name="evaluate error try"
                group-by="Dynamic-evaluation"
                description="Dynamic expression evaluation"
                spec="J.1 #05.b. A new xsl:evaluate instruction is provided, to allow evaluation of XPath expressions constructed dynamically from strings, or read from a source document." 
                by-instruction="evaluate">
             <q:query group-by="attribute-list" element-name="evaluate"  attributes="xpath as base-uri with-params context-item namespace-context schema-aware" />
        </q:set>
        
        <q:set name="assert error"
                group-by="Assertions"
                description="Assertions with xsl:assert"
                spec="J.1 #05.c. The xsl:assert instruction allows arbitrary assertions about the state of variables or the input document, improving testability and robustness." 
                by-instruction="evaluate">
             <q:query group-by="attribute-list" element-name="assert"  attributes="test select error-code" />
        </q:set>
        
        <q:set name="expand-text"
                group-by="text-value-templates"
                description="Text value templates"
                spec="J.1 #06. Text nodes within a sequence constructor may now contain text value templates (XPath expressions enclosed in curly brackets), if this is enabled by setting expand-text='yes' on an enclosing element." 
                by-attribute="expand-text">
            <q:query group-by="parent-name"/>
        </q:set>
        
        <q:set name="match maps error"
                group-by="patterns"
                description="Text value templates"
                spec="J.1 #07. The syntax of patterns has been generalized. Patterns may now match any item (not only nodes)." 
                by-instruction="template"
                filter-include="@match[starts-with(., '.')]">
        </q:set>
        
        <!-- maps -->
        <q:set name="maps sx-MapExpr si-map"
                group-by="maps"
                description="Map instruction"
                spec="J.1 #08. A new datatype, called a map, has been introduced, together with supporting functions, operators, and type syntax." 
                by-instruction="map">
        </q:set>
        
        <q:set name="maps sx-MapExpr si-map"
                group-by="maps"
                description="Map instruction (xsl:map-entry)"
                spec="J.1 #08. A new datatype, called a map, has been introduced, together with supporting functions, operators, and type syntax." 
                by-instruction="map-entry">
        </q:set>
        
        <q:set name="maps sx-MapExpr si-map"
                group-by="maps"
                description="Map functions"
                spec="J.1 #08. A new datatype, called a map, has been introduced, together with supporting functions, operators, and type syntax." 
                by-function="map">
            <q:query group-by="function" function-name="map:merge"/>
            <q:query group-by="function" function-name="map:size"/>
            <q:query group-by="function" function-name="map:keys"/>
            <q:query group-by="function" function-name="map:contains"/>
            <q:query group-by="function" function-name="map:get"/>
            <q:query group-by="function" function-name="map:put"/>
            <q:query group-by="function" function-name="map:entry"/>
            <q:query group-by="function" function-name="map:remove"/>
            <q:query group-by="function" function-name="map:for-each"/>
            <q:query group-by="function" function-name="collation-key"/>
        </q:set>
        
        <!-- miscellaneous changes #9 -->
        <!-- TODO: query for zero-length matching regexes -->
        <q:set name="TODO"
                group-by="regex"
                description="Zero-length string matching regexes"
                spec="J.1 #09.a. The regular expression supplied to the xsl:analyze-string instruction is now permitted to be one that matches a zero-length string." 
                by-instruction="*">
        </q:set>      

        <q:set name="copy si-copy"
                group-by="xsl:copy"
                description="Copy with @select"
                spec="J.1 #09.b. The xsl:copy instruction now has a select attribute, which is convenient when it is used inside a function where there is no context item." 
                by-instruction="copy"
                filter-include="@select">
            <q:query group-by="attribute" element-name="copy" />
        </q:set>      

        <q:set name="for-each-group si-for-each-group error"
                group-by="xsl:for-each-group composite-keys"
                description="Composite keys in for-each-group"
                spec="J.1 #09.c. Composite keys are supported in xsl:for-each-group." 
                by-instruction="for-each-group"
                filter-include="@composite = 'yes' or @composite='1' or @composite='true'">
            <q:query group-by="attribute" element-name="for-each-group" />
        </q:set>      

        <q:set name="function"
                group-by="identity-sensitive cache"
                description="Functions with identity-sensitive or cache"
                spec="J.1 #09.d. Two new attributes have been added to xsl:function to provide increased scope for optimization: identity-sensitive and cache." 
                by-instruction="function"
                filter-include="@identity-sensitive = 'yes' or @identity-sensitive='1' or @identity-sensitive='true' or @cache">
            <q:query group-by="attribute-list" element-name="function" attributes="cache identity-sensitive" />
        </q:set>      

        <q:set name="function"
                group-by="override-extension-function override"
                description="Renaming of override attribute into override-extension-function"
                spec="J.1 #09.d. The override attribute of xsl:function is renamed override-extension-function, retaining the old name as a deprecated synonym." 
                by-instruction="function"
                filter-include="@override-extension-function">
            <q:query group-by="attribute-list" element-name="function" attributes="override override-extension-function" />
        </q:set>      

        <q:set name="import"
                group-by="import"
                description="Order of xsl:import with preceding declarations"
                spec="J.1 #09.f. The rule requiring xsl:import declarations to precede all other declarations in a stylesheet module has been removed." 
                by-instruction="import"
                filter-include="preceding-sibling::*">            
        </q:set>      

        <q:set name="key error"
                group-by="xsl:key composite-keys"
                description="Composite keys in xsl:key"
                spec="J.1 #09.g. Composite keys are supported in xsl:for-each-group." 
                by-instruction="key"
                filter-include="@composite = 'yes' or @composite='1' or @composite='true'">
            <q:query group-by="attribute" element-name="key" />
        </q:set>
        
        <q:set name="message error"
                group-by="xsl:message error-code"
                description="Error codes returned from xsl:message"
                spec="J.1 #09.h. A new attribute on xsl:message allows specification of the error code to be returned with terminate='yes' is specified." 
                by-instruction="message"
                filter-include="(@terminate = 'yes' or @terminate='1' or @terminate='true') and @error-code">
            <q:query group-by="attribute" element-name="message" />
        </q:set>
        
        <q:set name="TODO"
                group-by="TODO"
                description="Error codes returned from xsl:message"
                spec="J.1 #09.i. The rules for handling conflicts between xsl:strip-space and xsl:preserve-space have changed. A conflict that can be detected statically is now signaled as a static error; a run-time conflict between two declarations having the same precedence and priority is now resolved by taking whichever comes last in declaration order." 
                by-instruction="TODO">
        </q:set>
        
        <q:set name="context-item error"
                group-by="xsl:message error-code"
                description="Error codes returned from xsl:message"
                spec="J.1 #09.j. An xsl:template declaration may contain an xsl:context-item element to declare the required type of the context item when the template is called." 
                by-instruction="context-item"
                filter-include="parent::*[local-name() = 'template']">
            <q:query group-by="attribute" element-name="context-item" />
        </q:set>
        
        <q:set name="*"
                group-by="xsl:value-of"
                description="xsl:value-of without @select"
                spec="J.1 #09.k. An empty xsl:value-of instruction with no select attribute is now permitted; its effect is to construct a zero-length text node." 
                by-instruction="value-of"
                filter-include="not(@select)">
            <q:query group-by="attribute" element-name="value-of" />
        </q:set>
                
        <q:set name="shadow use-when"
                group-by="xsl:variable static-variables xsl:param"
                description="Static variables"
                spec="J.1 #09.l. The xsl:variable and xsl:param elements may now specify static='yes'" 
                by-instruction="variable"
                filter-include="@static = 'yes' or @static='1' or @static='true'">
            <q:query group-by="attribute" element-name="variable" />
        </q:set>

        <q:set name="shadow use-when"
                group-by="xsl:variable static-variables xsl:param"
                description="Static parameters"
                spec="J.1 #09.l. The xsl:variable and xsl:param elements may now specify static='yes'" 
                by-instruction="param"
                filter-include="@static = 'yes' or @static='1' or @static='true'">
            <q:query group-by="attribute" element-name="param" />
        </q:set>
        
        <q:set name="json-to-xml"
                group-by="json"
                description="JSON functions"
                spec="J.1 #10. New functions are available to import and export data in JSON format." 
                by-function="json-to-xml">
            <q:query group-by="function" function-name="xml-to-json"/>
            <q:query group-by="function" function-name="json-to-xml"/>
        </q:set>

        <q:set name="xml-to-json"
                group-by="json"
                description="JSON functions"
                spec="J.1 #10. New functions are available to import and export data in JSON format." 
                by-function="xml-to-json">
            <q:query group-by="function" function-name="xml-to-json"/>
            <q:query group-by="function" function-name="json-to-xml"/>
        </q:set>

        <!-- TODO numbers 11-13 -->
        
        <q:set name="use-when"
                group-by="use-when"
                description="use-when with external documents"
                spec="J.1 #14. The rule that effectively prevented references to external documents in [xsl:]use-when expressions has been removed." 
                by-attribute="use-when"
                filte-include="contains(., 'doc(') or contains(., 'document(') or contains(., 'collection(') or contains(., 'unparsed-text(') or contains(., 'unparsed-text-lines')">
            <q:query group-by="function" function-name="doc"/>
            <q:query group-by="function" function-name="document"/>
            <q:query group-by="function" function-name="collection"/>
            <q:query group-by="function" function-name="unparsed-text"/>
            <q:query group-by="function" function-name="unparsed-text-lines"/>
        </q:set>
    </xsl:variable>

    <xsl:template match="/" name="xsl:initial-template">
        <xsl:apply-templates select="doc($testcat)" mode="cat"/>
    </xsl:template>

    <xsl:template match="*" mode="cat">
        <xsl:variable name="report">
            <report>
                <xsl:apply-templates mode="#current"/>
            </report>
        </xsl:variable>
        <report>
            <xsl:copy-of select="$report" use-when="false()"/>
            <xsl:for-each-group select="$report/*/*" group-by="@spec" use-when="true()">
                <xsl:sort select="current-grouping-key()" />
                <spec-ref section="J.1" item="{current-grouping-key()}">
                    <aggregate total-queried-stylesheets="{sum(current-group()/@total-queried-stylesheets)}" 
                        total-tests-in-applicable-testsets="{max(current-group()/@tests-in-test-set)}"
                        applicable-tests="{sum(current-group()/*/@count)}"/>
                    <xsl:apply-templates select="current-group()" mode="post-processing"/>
                </spec-ref>
            </xsl:for-each-group>
        </report>
    </xsl:template>
    
    <xsl:template match="*:category" mode="post-processing">
        <test-set applicable-tests="{sum(*/@count)}">
            <xsl:copy-of select="@* except (@spec, @group-by, @tests-in-test-set)" />
            <xsl:copy-of select="*" />
        </test-set>
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
                        environment/stylesheet/@file/string(resolve-uri(., base-uri(.))),
                        test-case/test/package/@file/string(resolve-uri(., base-uri(.))),
                        environment/package/@file/string(resolve-uri(., base-uri(.)))"
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
        <xsl:variable name="xsldocs" select="f:getdocs($tests, $set)" />
        <xsl:variable name="by-attrib" select="$xsldocs//*[f:query-by-attrib(., current())]" />
        <xsl:variable name="countseq" as="xs:integer*"
            select="count($by-attrib)"/>

        <xsl:if test="sum($countseq) gt 0">
            <category attribute="{@by-attribute}" tests-in-test-set="{$tests/@total-count}">
                <xsl:attribute name="test-set-name" select="$tests/@category"/>
                <xsl:copy-of select="@description | @spec"/>
                <xsl:attribute name="total-queried-stylesheets" select="count($xsldocs)"/>

                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="tests" select="$tests"/>
                    <xsl:with-param name="xsldocs" select="$by-attrib" />
                </xsl:apply-templates>
            </category>
        </xsl:if>
    </xsl:template>


    <xsl:template match="q:set[@by-function]" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="set" select="."/>

        <!-- count query in each xsl document -->
        <xsl:variable name="xsldocs" select="f:getdocs($tests, $set)" />
        <xsl:variable name="by-fun" select="$xsldocs//*[f:query-by-function(., current())]" />
        <xsl:variable name="countseq" as="xs:integer*"
            select="count($by-fun)"/>

        <xsl:if test="sum($countseq) gt 0">
            <category attribute="{@by-function}" tests-in-test-set="{$tests/@total-count}">
                <xsl:attribute name="test-set-name" select="$tests/@category"/>
                <xsl:copy-of select="@description | @spec"/>
                <xsl:attribute name="total-queried-stylesheets" select="count($xsldocs)"/>

                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="tests" select="$tests"/>
                    <xsl:with-param name="xsldocs" select="$by-fun" />
                </xsl:apply-templates>
            </category>
        </xsl:if>
    </xsl:template>


    <xsl:template match="q:set[@by-instruction]" mode="query">
        <xsl:param name="tests"/>
        <xsl:variable name="set" select="."/>

        <!-- count query in each xsl document -->
        <xsl:variable name="xsldocs" select="f:getdocs($tests, $set)" />
        <xsl:variable name="by-instr" select="$xsldocs//*[f:query-by-instruction(., current())]" />
        <xsl:variable name="countseq" as="xs:integer*"
            select="count($by-instr)"/>

        <xsl:if test="sum($countseq) gt 0">
            <category instruction="{@by-instruction}" tests-in-test-set="{$tests/@total-count}">
                <xsl:attribute name="test-set-name" select="$tests/@category"/>
                <xsl:attribute name="group-by" select="@group-by" />
                <xsl:copy-of select="@description | @spec"/>
                <xsl:attribute name="total-queried-stylesheets" select="count($xsldocs)"/>
                <xsl:apply-templates mode="#current">
                    <xsl:with-param name="tests" select="$tests"/>
                    <xsl:with-param name="xsldocs" select="$by-instr" />
                </xsl:apply-templates>
            </category>
        </xsl:if>
    </xsl:template>

    <xsl:template match="q:query[@group-by='parent-name']" mode="query">
        <xsl:param name="tests"/>
        <xsl:param name="xsldocs" />

        <xsl:variable name="q-set" select="current()/.."/>
        <xsl:variable name="instructions"
            select="
            for $doc in $xsldocs 
            return $doc//*[f:query-by-attrib(., $q-set)]
                /QName(namespace-uri(.), local-name(.))"/>

        <!-- count per instruction -->
        <xsl:for-each
            select="distinct-values($instructions[namespace-uri-from-QName(.) = 'http://www.w3.org/1999/XSL/Transform'])">
            <instruction name="xsl:{.}">
                <xsl:attribute name="count"
                    select="count($xsldocs//*[local-name() = local-name-from-QName(current())][f:query-by-attrib(., $q-set)])"
                />
            </instruction>
        </xsl:for-each>

        <!-- count per LRE -->
        <xsl:for-each select="distinct-values($instructions[namespace-uri-from-QName(.) = ''])">
            <literal-result-element name="{.}">
                <xsl:attribute name="count"
                    select="count($xsldocs//*[local-name() = local-name-from-QName(current())][f:query-by-attrib(., $q-set)])"
                />
            </literal-result-element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="q:query[@group-by='function']" mode="query">
        <xsl:param name="tests"/>
        <xsl:param name="xsldocs" />

        <xsl:variable name="q-set" select="current()/.."/>

        <xsl:variable name="function-names" as="xs:string*">
            <!-- TODO: test this -->
            <xsl:for-each select="$xsldocs[.]//@*">
                <xsl:analyze-string select="." regex="([-a-z0-9:]+ *)\(">
                    <xsl:matching-substring>
                        <xsl:sequence select="regex-group(1)"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:for-each>
        </xsl:variable>

        <!-- count per function -->
        <xsl:variable name="filtered-function-names" select="distinct-values($function-names)[. = current()/@function-name or empty(current()/@function-name)]" />
        <xsl:for-each select="$filtered-function-names">
            <function name="{.}" count="{count($function-names[. = current()])}" />
        </xsl:for-each>
        
        <!-- when count is zero -->
        <xsl:if test="empty($filtered-function-names)">
            <function name="{current()/@function-name}" count="0" />
        </xsl:if>
    </xsl:template>

    <xsl:template match="q:query[@group-by='attribute']" mode="query">
        <xsl:param name="tests"/>
        <xsl:param name="xsldocs" />

        <xsl:variable name="q-set" select="current()/.."/>

        <xsl:variable name="attributes" as="xs:string*">
            <xsl:for-each select="$xsldocs[//*[local-name() = current()/@element-name]]">
                <xsl:sequence select="@*/name()" />
            </xsl:for-each>
        </xsl:variable>

        <!-- count per attribute -->
        <xsl:for-each select="distinct-values($attributes)">
            <attribute name="{.}" count="{count($attributes[. = current()])}" />
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="q:query[@group-by='instruction']" mode="query">
        <xsl:param name="tests"/>
        <xsl:param name="xsldocs" />

        <xsl:variable name="q-set" select="current()/.."/>
        <xsl:variable name="elemname" select="@element-name" />

        <xsl:variable name="instructions" as="xs:string*">
            <xsl:for-each select="$xsldocs[//*
                    [local-name() = $elemname]
                    [parent::*[local-name() = current()/@parent or empty(current()/@parent)]]]">
                <xsl:sequence select="$elemname" />
            </xsl:for-each>
        </xsl:variable>

        <!-- count per attribute -->
        <xsl:for-each select="distinct-values($instructions)">
            <instruction name="xsl:{.}" count="{count($instructions[. = current()])}" />
        </xsl:for-each>
        
        <xsl:if test="empty($instructions)">
            <instruction name="xsl:{current()/@element-name}" count="0" />
        </xsl:if>
    </xsl:template>


    <xsl:template match="q:query[@group-by='attribute-list']" mode="query">
        <xsl:param name="tests"/>
        <xsl:param name="xsldocs" />
        <xsl:variable name="q-set" select="current()/.."/>
        <xsl:variable name="elem-name" select="@element-name" />

        <xsl:variable name="attributes" as="xs:string*">
            <xsl:for-each select="$xsldocs[//*[local-name() = current()/@element-name]]">
                <xsl:sequence select="@*/name()" />
            </xsl:for-each>
        </xsl:variable>

        <!-- positive count per attribute -->
        <xsl:for-each select="distinct-values($attributes)[let $item := . return current()/@attributes!tokenize(., ' ')[. = $item]]">
            <attribute name="{.}" count="{count($attributes[. = current()])}" element="{$elem-name}" />
        </xsl:for-each>
        
        <!-- zero-count per attribute -->
        <xsl:for-each select="current()/@attributes!tokenize(., ' ')[let $item := . return not(distinct-values($attributes) = $item)]">
            <attribute name="{.}" count="{count($attributes[. = current()])}" element="{$elem-name}" />
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="f:getdocs" as="document-node()*">
        <xsl:param name="tests"/>
        <xsl:param name="set"/>
        <xsl:copy-of select="document(tokenize($tests/@category[. = $set/@name/tokenize(., ' ') or $set/@name = '*']/../@xsluris, ' '))" />
    </xsl:function>

    <xsl:function name="f:query-by-attrib" as="xs:boolean">
        <xsl:param name="n"/>
        <xsl:param name="q-set"/>
        <xsl:sequence select="not(empty($n[@*[local-name() = $q-set/@by-attribute]]))"/>
    </xsl:function>

    <xsl:function name="f:query-by-function" as="xs:boolean">
        <xsl:param name="n"/>
        <xsl:param name="q-set"/>
        <xsl:sequence select="not(empty($n[@*[contains(., $q-set/@by-function)]]))"/>
    </xsl:function>

    <xsl:function name="f:query-by-instruction" as="xs:boolean">
        <xsl:param name="n"/>
        <xsl:param name="q-set"/>
        <xsl:sequence select="$q-set/@by-instruction eq '*' or (not(empty($n[self::*[local-name() = $q-set/@by-instruction]])) and f:bool-eval($n, $q-set/@filter-include))"/>
    </xsl:function>

    <xsl:function name="f:bool-eval" as="xs:boolean">
        <xsl:param name="n" />
        <xsl:param name="query" />
        <xsl:variable name="result">
            <xsl:evaluate xpath="('if(.[' || $query ||']) then true() else false()', false()!string(.))[1]" context-item="$n" />
        </xsl:variable>
        <xsl:sequence select="if(empty($query)) then true() else ($result)" />
    </xsl:function>
</xsl:stylesheet>
