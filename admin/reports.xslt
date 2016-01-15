<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xt="http://xt3report.com/functions"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="math xs xsi"
    version="3.0">
    
    <xsl:output indent="yes"/>
    
    <xsl:mode name="report" on-no-match="shallow-copy" />
    
    <xsl:template match="/">
        <report>
            <xsl:apply-templates select="doc('../catalog.xml')" mode="catalog"/>
        </report>
    </xsl:template>
    
    <xsl:template match="/" mode="catalog">
        <xsl:variable name="all">
            <category name="Attributes">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/attr/')]" mode="#current" />
            </category>
            <category name="Declarations">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/decl/')]" mode="#current" />
            </category>
            <category name="Expressions">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/expr/')]" mode="#current" />
            </category>
            <category name="Functions">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/fn/')]" mode="#current" />
            </category>
            <category name="Instructions">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/insn/')]" mode="#current" />
            </category>
            <category name="Miscellaneous">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/misc/')]" mode="#current" />
            </category>
            <category name="Posture and Sweep">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/sandp/')]" mode="#current" />
            </category>
            <category name="Streaming">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/strm/')]" mode="#current" />
            </category>
            <category name="Typing and schema">
                <xsl:apply-templates select="catalog/test-set[@file/contains(., '/type/')]" mode="#current" />
            </category>
        </xsl:variable>
        <xsl:apply-templates select="$all" mode="report" />
    </xsl:template>
    
    <xsl:template match="/" mode="report">
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <overview total-tests-in-xt3="{sum(//test-set/@total-tests)}">
                <xslt3-specific count="{sum(//xslt3-specific/@count)}" />
                <xslt2-specific count="{sum(//xslt2-specific/@count)}" />
                <xslt-other count="{sum(//xslt-other/@count)}" />
            </overview>
            <changes-since-xslt2>
                <!-- packages -->
                <feature group="Packages" name="Packages - versioning" count="{15 (: deep query needed :)}" />
                <feature group="Packages" name="Packages - package" count="{sum(//category[@name='Declarations']/test-set[@name=('package')]/@total-tests)}" />
                <feature group="Packages" name="Packages - use-package" count="{sum(//category[@name='Declarations']/test-set[@name=('use-package')]/@total-tests)}" />
                <feature group="Packages" name="Packages - override" count="{sum(//category[@name='Declarations']/test-set[@name=('override')]/@total-tests)}" />
                <feature group="Packages" name="Packages - xquery" count="{'unknown'}" />

                <!-- streaming -->
                <feature group="Streaming" name="Streaming - instructions" count="{sum(//category[@name='Streaming']/test-set[@name/starts-with(., 'si')]/@total-tests)}" />
                <feature group="Streaming" name="Streaming - functions" count="{sum(//category[@name='Streaming']/test-set[@name/starts-with(., 'sf')]/@total-tests)}" />
                <feature group="Streaming" name="Streaming - expressions" count="{sum(//category[@name='Streaming']/test-set[@name/starts-with(., 'sx')]/@total-tests)}" />
                <feature group="Streaming" name="Streaming - posture and sweep" count="{sum(//category[@name=('Posture and Sweep')]/test-set/@total-tests)}" />
                <feature group="Streaming" name="Streaming - other" count="{sum(//category[@name='Streaming']/test-set[@name[not(starts-with(., 'si') or starts-with(., 'sf') or starts-with(., 'sx'))]]/@total-tests)}" />
                
                <!-- new declarations -->
                <feature group="Declarations" name="Accumulators" count="{sum(//category[@name='Declarations']/test-set[@name='accumulator']/@total-tests)}" />
                <feature group="Declarations" name="Mode declarations" count="{sum(//category[@name=('Attributes' (: there's no decl/mode category :) , 'Miscellaneous')]/test-set[@name=('initial-mode', 'mode')]/xslt3-specific/@count)}" />
                <feature group="Declarations" name="Import declaration order relaxation" count="{sum(//category[@name=('Declarations')]/test-set[@name=('import')]/xslt3-specific/@count)}" />
                <feature group="Declarations" name="Context item declaration" count="{sum(//category[@name=('Declarations')]/test-set[@name=('context-item')]/@total-tests)}" />
                <feature group="Declarations" name="Global context item declaration" count="{sum(//category[@name=('Declarations')]/test-set[@name=('global-context-item')]/@total-tests)}" />
                
                <!-- new instructions -->
                <feature group="Instructions" name="Try / catch" count="{sum(//category[@name='Instructions']/test-set[@name=('try')]/@total-tests)}" />
                <feature group="Instructions" name="Try / catch - rollback-output" count="{2 (: deep-search needed :)}" />
                <feature group="Instructions" name="Iteration (xsl:iterate)" count="{sum(//category[@name='Instructions']/test-set[@name=('iterate')]/@total-tests)}" />
                <feature group="Instructions" name="Dynamic evaluation (xsl:evaluate)" count="{sum(//category[@name='Instructions']/test-set[@name=('evaluate')]/@total-tests)}" />
                <feature group="Instructions" name="Assertions (xsl:assert)" count="{sum(//category[@name='Instructions']/test-set[@name=('assert')]/@total-tests)}" />
                <feature group="Instructions" name="Merging (xsl:merge, incl strm)" count="{sum(//category[@name=('Instructions', 'Streaming')]/test-set[@name=('merge', 'si-merge')]/@total-tests)}" />
                <feature group="Instructions" name="Conditional content construction (all)" count="{70 + 28 (: see next :)  + sum(//category[@name='Instructions']/test-set[@name=('on-empty', 'on-non-empty')]/@total-tests)}" />
                <feature group="Instructions" name="Conditional content construction - conditional-content" count="{70 (: deep search needed :)}" />
                <feature group="Instructions" name="Conditional content construction - on-empty" count="{28 (: deep search needed :) + sum(//category[@name='Instructions']/test-set[@name=('on-empty')]/@total-tests)}" />
                <feature group="Instructions" name="Conditional content construction - on-non-empty" count="{(: all are in cat on-non-empty :) sum(//category[@name='Instructions']/test-set[@name=('on-non-empty')]/@total-tests)}" />
                <feature group="Instructions" name="Enhancements to analyze-string" count="{sum(//category[@name=('Instructions')]/test-set[@name=('analyze-string')]/xslt3-specific/@count)}" />
                <feature group="Instructions" name="Value-of enhancement (empty)" count="{sum(//category[@name=('Instructions')]/test-set[@name=('value-of')]/xslt3-specific/@count)}" />
                <feature group="Instructions" name="Number (xsl:number format-number) enhancements" count="{sum(//category[@name=('Instructions', 'Functions')]/test-set[@name=('number', 'format-number')]/xslt3-specific/@count)}" />

                <!-- new attributes -->
                <feature group="Attributes" name="Declared modes" count="{sum(//category[@name='Attributes']/test-set[@name=('declared-modes')]/@total-tests)}" />
                <feature group="Attributes" name="Decimal format with exponent-separator" count="{(: there is no cat decimal-format, create/move from format-number? :) sum(//category[@name=('Attributes', 'Declarations')]/test-set[@name=('decimal-format', 'exponent-separator')]/@total-tests)}" />
                <feature group="Attributes" name="Composite keys in for-each-group" count="{15 (: deep search needed:) (: sum(//category[@name=('Instructions')]/test-set[@name=('for-each-group')]/xslt3-specific/@count) :)}" />
                <feature group="Attributes" name="Composite keys in keys" count="{sum(//category[@name=('Functions')]/test-set[@name=('key')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Select attribute on copy instruction" count="{sum(//category[@name=('Instructions')]/test-set[@name=('copy')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Static variables and parameters" count="{sum(//category[@name=('Attributes')]/test-set[@name=('static')]/@total-tests)}" />
                <feature group="Attributes" name="Cache, override, identity attributes on function declaration" count="{sum(//category[@name=('Declarations')]/test-set[@name=('function')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Shadow attributes" count="{sum(//category[@name=('Attributes')]/test-set[@name=('shadow')]/@total-tests)}" />
                <feature group="Attributes" name="Use-when enhancements" count="{sum(//category[@name=('Attributes')]/test-set[@name=('use-when')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Error-code attribute on message" count="{(: deep query needed :) sum(//category[@name=('Instructions')]/test-set[@name=('message')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Html-version attribute on xsl:output/result-document (HTML5 support)" count="{30 (: 4 on r-doc, 26 on output, deep search needed :)}" />
                <feature group="Attributes" name="Item-separator attribute on xsl:output/result-document" count="{0 (: none found, deep search needed :)}" />
                <feature group="Attributes" name="Parameter-document attribute on xsl:output/result-document" count="{0 (: none found, deep search needed :)}" />
                <feature group="Attributes" name="Suppress-indentation attribute on xsl:output/result-document" count="{(: deep query needed? :) sum(//category[@name=('Declarations', 'Instructions')]/test-set[@name=('output', 'result-document')]/xslt3-specific/@count)}" />
                <feature group="Attributes" name="Disable-output-escaping silently ignored" count="{2 (: deep query needed? :)}" />
                <feature group="Attributes" name="Enhancements on typed=lax for non-validating processors" count="{'unknown'}" />

                <!-- stylesheet initialization -->
                <feature group="Stylesheet initialization" name="Initial function" count="{sum(//category[@name='Miscellaneous']/test-set[@name=('initial-function')]/@total-tests)}" />
                <feature group="Stylesheet initialization" name="Initial template (xsl:initial-template)" count="{sum(//category[@name='Miscellaneous']/test-set[@name=('initial-template')]/xslt3-specific/@count)}" />
                <feature group="Stylesheet initialization" name="Initial mode" count="{sum(//category[@name=('Attributes', 'Miscellaneous')]/test-set[@name=('initial-mode')]/xslt3-specific/@count)}" />

                <!-- new functions -->
                <feature group="Functions" name="Higher order functions" count="{sum(//category[@name='Expressions']/test-set[@name=('higher-order-functions')]/@total-tests)}" />
                <feature group="Functions" name="New function current-output-uri" count="{sum(//category[@name=('Functions')]/test-set[@name=('current-output-uri')]/@total-tests)}" />
                <feature group="Functions" name="New function collation-key" count="{sum(//category[@name=('Functions')]/test-set[@name=('collation-key')]/@total-tests)}" />
                <feature group="Functions" name="New function copy-of" count="{sum(//category[@name=('Functions', 'Streaming')]/test-set[@name=('copy-of', 'sf-copy-of')]/@total-tests)}" />
                <feature group="Functions" name="New function json-to-xml" count="{sum(//category[@name=('Functions')]/test-set[@name=('json-to-xml')]/@total-tests)}" />
                <feature group="Functions" name="New function snapshot" count="{sum(//category[@name=('Functions', 'Streaming')]/test-set[@name=('snapshot', 'sf-snapshot')]/@total-tests)}" />
                <feature group="Functions" name="New function stream-available" count="{sum(//category[@name=('Functions', 'Streaming')]/test-set[@name=('stream-available', 'sf-stream-available')]/@total-tests)}" />
                <feature group="Functions" name="New function xml-to-json" count="{sum(//category[@name=('Functions')]/test-set[@name=('xml-to-json')]/@total-tests)}" />
                
                <!-- changes in existing functions -->
                <!-- note: regex-group, document, type-available and key have not changed, but normative references have -->
                <feature group="Functions" name="Enhancements on function deep-equal (maps support)" count="{(: there are three tests in maps that test disappearance of deep-equal2 :) sum(//category[@name=('Functions')]/test-set[@name=('deep-equal')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function document (new error)" count="{(: there are three tests in maps that test disappearance of deep-equal2 :) sum(//category[@name=('Functions')]/test-set[@name=('document')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function format-number (moved, but new formats)" count="{sum(//category[@name=('Functions')]/test-set[@name=('format-number')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function key (composite keys)" count="{sum(//category[@name=('Functions')]/test-set[@name=('key')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function type-available (XSD 1.1)" count="{sum(//category[@name=('Functions')]/test-set[@name=('type-available')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function system-property (new properties)" count="{sum(//category[@name=('Functions')]/test-set[@name=('system-property')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function unparsed-entity-uri (arity zero)" count="{(: only one 2.0 test :) sum(//category[@name=('Functions')]/test-set[@name=('unparsed-entity-uri')]/xslt3-specific/@count)}" />
                <feature group="Functions" name="Enhancements on function unparsed-entity-public-id (arity zero)" count="{(: cat does not exist :) sum(//category[@name=('Functions')]/test-set[@name=('unparsed-entity-public-id')]/xslt3-specific/@count)}" />
                
                <!-- maps (functions count by hand) -->
                <feature group="Maps" name="Maps - function contains" count="{1 (: in accumulator :)}" />
                <feature group="Maps" name="Maps - function entry" count="{0 (: can't find, probably none yet :)}" />
                <feature group="Maps" name="Maps - function get" count="{2 (: in accumulator, maps :)}" />
                <feature group="Maps" name="Maps - function for-each" count="{0 (: can't find, probably none yet :)}" />
                <feature group="Maps" name="Maps - function keys" count="{4 (: si-iterate, maps, accumulator :)}" />
                <feature group="Maps" name="Maps - function merge" count="{5 (: si-iterate, maps, sx-MapExpr :)}" />
                <feature group="Maps" name="Maps - function put" count="{2 (: accumulator :)}" />
                <feature group="Maps" name="Maps - function remove" count="{0 (: can't find, probably none yet :)}" />
                <feature group="Maps" name="Maps - function size" count="{2 (: error, maps :)}" />
                <feature group="Maps" name="Maps - expressions / other" count="{36 (: total in maps of 52, minus the above of 16 :)}" />
                
                <!-- other -->
                <feature group="Other" name="Expand text, text value templates" count="{sum(//category[@name='Attributes']/test-set[@name=('expand-text')]/@total-tests)}" />
                <feature group="Other" name="Pattern enhancements" count="{sum(//category[@name='Attributes']/test-set[@name=('match')]/xslt3-specific/@count)}" />
                <feature group="Other" name="EQName adoption" count="{23 (: deep search needed, or new category :) }" />
                <feature group="Other" name="JSON support (total)" count="{sum(//category[@name=('Functions')]/test-set[@name=('json-to-xml', 'xml-to-json')]/@total-tests)}" />
                <feature group="Other" name="Default collation enhancements (allowed on any element)" count="{sum(//category[@name=('Functions', 'Miscellaneous')]/test-set[@name=('collation', 'collations')]/xslt3-specific/@count)}" />
                <feature group="Other" name="Backwards compatibility (XSLT 3.0 to 2.0)" count="{sum(//category[@name=('Miscellaneous')]/test-set[@name=('backwards', 'xslt-compat')]/xslt3-specific/@count)}" />
                <feature group="Other" name="New error conditions and codes" count="{sum(//category[@name=('Miscellaneous')]/test-set[@name=('error')]/xslt3-specific/@count)}" />
                <feature group="Other" name="Recoverable errors do not exist anymore" count="{'unknown'}" />
                <feature group="Other" name="Enhancements to serialization (all)" count="{sum(//category[@name=('Declarations', 'Instructions')]/test-set[@name=('output', 'result-document')]/xslt3-specific/@count)}" />
                <feature group="Other" name="Type attribute validation with complex types and copy/copy-of (XTTE1535)" count="{'unknown'}" />
                <feature group="Other" name="XSD 1.1 types" count="{'unknown'}" />

            </changes-since-xslt2>
            <xsl:apply-templates mode="report" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="category" mode="report">
         <xsl:copy>
             <xsl:copy-of select="@*" />
             <overview total-tests-in-category="{sum(.//test-set/@total-tests)}">
                 <xslt3-specific count="{sum(.//xslt3-specific/@count)}" />
                 <xslt2-specific count="{sum(.//xslt2-specific/@count)}" />
                 <xslt-other count="{sum(.//xslt-other/@count)}" />
             </overview>
             <xsl:apply-templates mode="report" />
         </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:report" mode="report">
         <xsl:copy>
             <overview>
                 <xslt3-specific count="{sum(//xslt3-specific/@count)}" />
                 <xslt2-specific count="{sum(//xslt2-specific/@count)}" />
                 <xslt-other count="{sum(//xslt-other/@count)}" />
             </overview>
             <xsl:apply-templates />
         </xsl:copy>
    </xsl:template>
    
    
    
    <xsl:template match="test-set" mode="catalog">
        <xsl:apply-templates select="doc(concat('../', @file))" mode="test-set" />
    </xsl:template>
    
    <!-- count the number of tests depending on the XSLT version supported -->
    <xsl:template match="/" mode="test-set">
        
        
        <xsl:variable name="xslt3" select="xt:count-tests-by-spec-version(test-set, 'XSLT30')" />
        <xsl:variable name="xslt2" select="xt:count-tests-by-spec-version(test-set, 'XSLT20')" />
        
        <test-set total-tests="{count(test-set/test-case)}" name="{test-set/@name}" description="{normalize-space(test-set/description)}">
            <xslt3-specific count="{$xslt3}" />
            <xslt2-specific count="{$xslt2}" />
            <xslt-other  count="{count(test-set/test-case) - $xslt3 - $xslt2}" />
            <keywords use-when="false()">
                <xsl:variable name="keywords" select="distinct-values(test-set/test-case/keywords/tokenize(., ' '))"/>
                <xsl:variable name="keywords-with-dupes" select="test-set/test-case/keywords/tokenize(., ' ')" />
                <xsl:for-each select="$keywords">
                    <key name="{.}" count="{count($keywords-with-dupes[. = current()])}" />
                </xsl:for-each>                    
            </keywords>
        </test-set>
    </xsl:template>
    
    <!-- count number of tests in a test-set based on spec-version -->
    <xsl:function name="xt:count-tests-by-spec-version">
        <xsl:param name="test-set" />
        <xsl:param name="spec-version" />
        
        <xsl:variable name="count-all-in-set" select="count($test-set/test-case)" />
        
        <xsl:value-of select="(: if a top level dependencies is present :)
            if($test-set/dependencies/spec[@value/contains(., $spec-version)])
            
            (: then count all, except those that are overridden :)
            then $count-all-in-set -  count($test-set/test-case/dependencies[spec[@value/not(contains(., $spec-version))]])
            
            (: else, count only the ones that are overridden locally :)
            else count($test-set/test-case/dependencies[spec[@value/contains(., $spec-version)]])" />
    </xsl:function>
    
 </xsl:stylesheet>