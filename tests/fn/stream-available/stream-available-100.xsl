<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xpath="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://w3c-tests"
    exclude-result-prefixes="xs math f xpath"
    version="3.0">
    
    <!--
        Author: Abel Braaksma
        Date: 2015-09-15
        Base file for testing system-properties, this is by en large an XSLT way of writing certain F# tests we have 
        (it's a little bit alarming that a handful of F# lines end up so wieldy, perhaps it can be done easier, but it
        does the job: testing a variety of scenarios for each stream-available).
        
        Usage (call with default initial template):
        $property:     the argument to be used in stream-available, including 'xsl:'
        $result:       the items to test for, i.e. '' or '3.0', '3.1'
        $method:       see below for details on the method. $result should be '' for no-namespace and wrong-namespace
        
        If any of these tests fail, the result contains more info on what expressions failed.
        
        In the case of a not-satisfies (not($is-valid)) in the static context, the result
        will contain a detailed XML that shows what expression returned what result. The $is-valid param
        simply tests the value of the stream-available in the static context for consistency. Once valid
        the rest of the test tests the system property in a variety of other contexts and calling scenarios.
        
        Available methods and their intentions:
        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
        all:                    all tests test results of stream-available calls for allowed values,
                                all tests have a static call, a prefixed static call, an eqname static call
                                a dynamic call in static context, a dynamic call in dynamic context, a 
                                call inside a let-binding, and a static and dynamic call inside an anon function
                                all tests test the variants both in static and in dynamic evaluation contexts
                                
        static:                 uses static string 'xsl:propname' in a normal evaluation context
                                (body of a function) 
        dynamic:                uses static string 'xsl:propname' in an xsl:evaluate context (includes 
                                expected exceptions)
        no-namespace:           strips the prefix from 'xsl:propname' and sets the default namespace to the 
                                XSLT namespace (all props should return empty strings)
        eqname:                 changes 'xsl:propname' into equiv. EQName, and then the same as static
        wrong-namespace:        tests 'xsl:propname' but switches locally to a different binding for 'xsl' 
                                prefix and expects all results to be empty. This also tests namespace scope
                                of inline function declarations and static bindings
        other-namespace-prefix: tests 'xyz:propname' with 'xyz' prefix locally bound to a different namespace
                                This is the positive variant of namespace scoping of 'wrong-namespace' above.
        integer                 attempts to call the function with a invalid argument, here an integer, which should fail
        
    -->
    
    <xsl:output indent="yes" />
    
    <xsl:param name="property" static="yes" select="'xsl:version'"/>
    <xsl:param name="result" static="yes" select="''"/>
    <xsl:param name="method" static="yes" select="'no-namespace'"/>
    
    <!-- helper to escape single quotes, or to quote a string -->
    <xsl:variable name="e" static="yes" select="replace(?, '''', '''''')" />
    <xsl:variable name="q" static="yes" select="function($x) { '''' || $x || '''' } " />
    <xsl:variable name="r" static="yes" select="function($x) { '(' || string-join(($x ! $q(.)), ', ') || ')' } " />
    <xsl:variable name="uses-namespaces" static="yes" select="contains($method, 'namespace')" />
    <xsl:variable name="prefixes" static="yes" select="'', 'xpath:', 'Q{http://www.w3.org/2005/xpath-functions}'" />
    <xsl:variable name="apply" static="yes" select="function($f, $arg) { '(' || string-join($prefixes ! concat(., $f, ($arg ! ('(' || . || ')'), '#1')[1]), ', ') || ')' }" />

    <!-- whether tests are expected to raise errors when used in XPaths in static context -->
    <xsl:variable name="raises" static="yes" select="$method = 'integer'" />

    <!-- for use with tests that use a dynamic function call -->
    <xsl:variable name="sysfun" static="yes" _select="{$apply('stream-available', ())}" use-when="not($uses-namespaces)"/>
    
    <!-- this prevents incorrect closure of lexical value-space -->
    <xslt:variable name="sysfun" static="yes" _select="{$apply('stream-available', ())}" use-when="$uses-namespaces" 
        xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform"
        xmlns:xyz="http://www.w3.org/1999/XSL/Transform"
        xmlns:xslt="http://www.w3.org/1999/XSL/Transform"/>
    

    <xsl:variable name="argument" static="yes" select="
        if($method = 'static') then $q($property)
        else if($method = 'dynamic') then $q($property)
        else if($method = 'no-namespace') then $q(replace($property, '[^:]+:', ''))
        else if($method = 'eqname') then $q(replace($property, '[^:]+:', 'Q{http://www.w3.org/1999/XSL/Transform}'))
        else if($method = 'wrong-namespace') then $q($property)
        else if($method = 'other-namespace-prefix') then $q(replace($property, '[^:]+:', 'xyz:'))
        else if($method = 'integer') then 'QName(''http://www.w3.org/1999/XSL/Transform'', ' || $q(replace($property, '[^:]+:', 'xyz:')) || ')'
        else error(QName('', 'ERR0001'), 'Test case configuration error: wrong value for $type')" />
    
    <!-- creates expr-as-string: stream-available('xsl:xxxxx') -->
    <xsl:variable name="_staticcall" static="yes" select="$apply('stream-available', $argument)" />
    
    <!-- creates expr-as-string: (let $var := 'xsl:xxxxx' return stream-available($var)) -->
    <xsl:variable name="_letcall" static="yes" _select="'(let $var := {$e($argument)} return {$apply('stream-available', '$var')})'" />
    
    <!-- creates expr-as-string: $sysfun('xsl:xxxxx') -->
    <xsl:variable name="_dyncall" static="yes" _select="'(for $i in (1 to 3) return $sysfun[$i]( { $e($argument) } ))'" />
    
    
    <!-- creates expr-as-string (tests multiple call types from anon function):
        (let $f := function() { 
            if(stream-available('xsl:version') = $sysfun(' xsl:version ')) 
            then (let $var := 'xsl:version' return stream-available($var)) 
            else 'unsuccessful' } 
         return $f()) -->
    <xsl:variable name="_anoncall" static="yes" _select="'(let $f := function() {{ if({ ($e($_staticcall)) } = { $e($_dyncall) }) then { $e($_letcall) } else ''unsuccessful'' }} return $f())' " />
    
    <!-- tests whether the system property is valid in a static context -->
    <xsl:variable name="is-valid" 
        _select='{$_staticcall} = {$_anoncall} and {$_staticcall } = { $r($result) }' 
        static="yes" 
        use-when="not($raises) and not($uses-namespaces)"/>
    
    <!-- namespaces must be in-scope when the expr-to-string is evaluated -->
    <xslt:variable name="is-valid" 
        _select='{$_staticcall} = {$_anoncall} and {$_staticcall } = { $r($result) }' 
        static="yes" 
        use-when="not($raises) and $uses-namespaces"  
        xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
        xmlns:xslt="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xyz="http://www.w3.org/1999/XSL/Transform"/>
    
    <!-- we cannot capture an exception in XPath and we cannot call a stylesheet function in the static context, so we cannot test exception in static expression unless we break the rest of the test -->
    <xsl:variable name="is-valid" select='true()' static="yes" use-when="$raises"/>
    
    <xsl:template name="xsl:initial-template" expand-text="true" use-when="$is-valid" >
        <xsl:variable name="test" select="f:test()" />
        <result total="{if(every $val in $test satisfies $val = $result) then 'success' else 'fail'}" count="{count($test)}">
            <!-- note: this shadows global $e, this is intentional, but is not part of the test -->
            <xsl:variable name="e" select="$test ! (if(. = '') then 'empty' else .)" />
            <staticcall expr="{$_staticcall}" result="{$e[1], $e[2], $e[3]}" />
            <letcall    expr="{$_letcall}"    result="{$e[4], $e[5], $e[6]}"  />
            <dyncall    expr="{$_dyncall}"    result="{$e[7], $e[8], $e[9]}"  />
            <anoncall   expr="{$_anoncall}"   result="{$e[10]}"  />
        </result>
    </xsl:template>

    <!-- helper for analysis, with proper test results, you never get here -->
    <xsl:template name="xsl:initial-template" use-when="not($is-valid) and not($uses-namespaces)">
        <result total="unexpected-result" count="unknown" namespace="no">
            <description>!!!Result of evaluations is not as expected, see following elements for details</description>
            <staticcall expr="{$_staticcall}"><xsl:attribute name="result" _select="{$_staticcall}" /></staticcall>
            <letcall expr="{$_letcall}"><xsl:attribute name="result" _select="{$_letcall}"  /></letcall>
            <dyncall expr="{$_dyncall}"><xsl:attribute name="result" _select="{$_dyncall}"  /></dyncall>
            <anoncall expr="{$_anoncall}"><xsl:attribute name="result" _select="{$_anoncall}"  /></anoncall>
        </result>
    </xsl:template>
    
    <!-- helper for analysis, with proper test results, you never get here -->
    <other:template name="other:initial-template" use-when="not($is-valid) and $uses-namespaces"  
        xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" 
        xmlns:other="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xyz="http://www.w3.org/1999/XSL/Transform"
        exclude-result-prefixes="#all">
        <result total="unexpected-result" count="unknown" namespace="yes">
            <description>!!!Result of evaluations is not as expected, see following elements for details</description>
            <staticcall expr="{$_staticcall}"><other:attribute name="result" _select="{$_staticcall}"/></staticcall>
            <letcall expr="{$_letcall}"><other:attribute name="result" _select="{$_letcall}"/></letcall>
            <dyncall expr="{$_dyncall}"><other:attribute name="result" _select="{$_dyncall}" /></dyncall>
            <anoncall expr="{$_anoncall}"><other:attribute name="result" _select="{$_anoncall}" /></anoncall>
        </result>
    </other:template>
    
    <!-- 
        what follows are variants of the test based on the method chosen 
    -->
    <xsl:function name="f:test" use-when="$method='integer'">
        <xsl:variable name="caught" select="'exception'" />
        <xsl:sequence select="tokenize($_staticcall, ',') ! f:evaluate-or-catch(.)" />
        <xsl:sequence select="tokenize($_letcall, ',') ! f:evaluate-or-catch(.)" />
        <xsl:sequence select="tokenize($_dyncall, ',') ! f:evaluate-or-catch(.)" />
        <xsl:sequence select="f:evaluate-or-catch($_anoncall)" />           
    </xsl:function>

    <!-- tests stream-available in no-namespace, $result should be set to '', no error -->
    <xsl:function name="f:test" use-when="$method='other-namespace-prefix'" xmlns:xyz="http://www.w3.org/1999/XSL/Transform">
        <xsl:sequence _select="{$_letcall}" />
        <xsl:sequence _select="{$_dyncall}" />
        <xsl:sequence _select="{$_staticcall}" />
        <xsl:sequence _select="{$_anoncall}" />        
    </xsl:function>

    <!-- tests stream-available in no-namespace, $result should be set to '', no error -->
    <xsl:function name="f:test" use-when="$method='no-namespace'">
        <xsl:sequence _select="{$_letcall}" xmlns="http://www.w3.org/1999/XSL/Transform"/>
        <xsl:sequence _select="{$_dyncall}" xmlns="http://www.w3.org/1999/XSL/Transform"/>
        <xsl:sequence _select="{$_staticcall}" xmlns="http://www.w3.org/1999/XSL/Transform"/>
        <xsl:sequence _select="{$_anoncall}" xmlns="http://www.w3.org/1999/XSL/Transform"/>        
    </xsl:function>
    
    <!-- tests stream-available in wrong/invalid namespace, $result should be set to '', no error -->
    <xsl:function name="f:test" use-when="$method='wrong-namespace'">
        <xslt:sequence _select="{$_staticcall}" xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform"/>
        <xslt:sequence _select="{$_letcall}" xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform"/>
        <xslt:sequence _select="{$_dyncall}" xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform"/>
        <xslt:sequence _select="{$_anoncall}" xmlns:xsl="http://WRONG.w3.org/1999/XSL/Transform" xmlns:xslt="http://www.w3.org/1999/XSL/Transform"/>        
    </xsl:function>
    
    <xsl:function name="f:test" use-when="$method='static' or $method = 'eqname'">
        <xsl:sequence _select="{$_letcall}, {$_dyncall}, {$_staticcall}, {$_anoncall}" />
    </xsl:function>
    
    <xsl:function name="f:test" use-when="$method = 'dynamic'">
        <xsl:variable name="caught" select="'exception'" />
        
        <xsl:sequence select="tokenize($_staticcall, ',') ! f:evaluate-or-catch(.)" />
        <xsl:sequence select="tokenize($_letcall, ',') ! f:evaluate-or-catch(.)" />

        <!--
            note (1): it should not be necessary to rename the variable 
            note (2): there are no rules that ban a function item bound to a function that 
            itself is not statically available inside an evaluation context, so we assume here 
            that it does NOT raise an error 
        -->
        <xsl:evaluate xpath="replace($_dyncall, 'sysfun', 'sysfun2')" >
            <xsl:with-param name="sysfun2" select="$sysfun" />
        </xsl:evaluate>
        
        <xsl:sequence select="tokenize($_staticcall, ',') ! f:evaluate-or-catch(.)" />
        <xsl:try>
            <xsl:evaluate xpath="$_staticcall"/>
            <xsl:catch errors="*:XPST0017" select="$caught" />            
        </xsl:try>

        <xsl:sequence select="f:evaluate-or-catch(replace($_anoncall, 'sysfun', 'sysfun2'))" />

    </xsl:function>
    
    <xsl:function name="f:evaluate-or-catch">
        <xsl:param name="xpath" />
        <xsl:try>
            <xsl:evaluate xpath="$_letcall" >
                <!-- req. by anoncall -->
                <xsl:with-param name="sysfun2" select="$sysfun" />
            </xsl:evaluate>
            <!-- for stream-available inside xsl:evaluate -->
            <xsl:catch errors="*:XPST0017" select="'exception'" />
            <!-- for QName as argument -->             
            <xsl:catch errors="*:XPST0004" select="'exception'" />            
        </xsl:try>
    </xsl:function>
    
</xsl:stylesheet>