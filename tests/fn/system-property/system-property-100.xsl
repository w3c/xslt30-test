<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xpath="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:f="http://w3c-tests"
    xmlns:data="urn:data"
    xmlns:v="urn:value-or-strings"
    xmlns:sc="urn:static-context-functions-and-results"
    xmlns:dc="urn:dynamic-context-functions-and-results"
    xmlns:d="urn:data-variable"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    
    <!--
        Author: Abel Braaksma
        Date: 2015-09-15
        Base file for testing system-properties, this is by en large an XSLT way of writing certain F# tests we have 
        (it's a little bit alarming that a handful of F# lines end up so wieldy, perhaps it can be done easier, but it
        does the job: testing a variety of scenarios for each system-property).
        
        Usage (call with default initial template):
        $property:     the argument to be used in system-property, including 'xsl:'
        $result:       the items to test for, i.e. '' or '3.0', '3.1'
        $method:       see below for details on the method. $result should be '' for no-namespace and wrong-namespace
        
        If any of these tests fail, the result contains more info on what expressions failed.
        
        In the case of a not-satisfies (not($is-valid)) in the static context, the result
        will contain a detailed XML that shows what expression returned what result. The $is-valid param
        simply tests the value of the system-property in the static context for consistency. Once valid
        the rest of the test tests the system property in a variety of other contexts and calling scenarios.
        
        Available methods and their intentions:
        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
        all:                    all tests test results of system-property calls for allowed values,
                                all tests have a static call, a prefixed static call, an eqname static call
                                a dynamic call in static context, a dynamic call in dynamic context, a 
                                call inside a let-binding, and a static and dynamic call inside an anon function
                                all tests test the variants both in static and in dynamic evaluation contexts
                                
        static:                 uses static string 'xsl:propname' in a normal evaluation context
                                (body of a function) 
        evaluate:               uses static string 'xsl:propname' in an xsl:evaluate context (includes 
                                expected exceptions)
        no-namespace:           strips the prefix from 'xsl:propname' and sets the default namespace to the 
                                XSLT namespace (all props should return empty strings)
        eqname:                 changes 'xsl:propname' into equiv. EQName, and then the same as static
        wrong-namespace:        tests 'xsl:propname' but switches locally to a different binding for 'xsl' 
                                prefix and expects all results to be empty. This also tests namespace scope
                                of inline function declarations and static bindings
        other-namespace-prefix: tests 'xyz:propname' with 'xyz' prefix locally bound to a different namespace
                                This is the positive variant of namespace scoping of 'wrong-namespace' above.
        qname                   attempts to call the function with a QName(xsl-ns, propname), which should fail
        
    -->
    
    <xsl:output indent="yes" />
    
    <xsl:param name="property" static="yes" select="'other:xsd-version'"/>
    <xsl:param name="result" static="yes" select="'1.0'"/>
    <xsl:param name="method" static="yes" select="'tunneled'"/>
    <xsl:param name="ns-scope" static="yes" select="
        (
        'normal',                     (: the 'xsl' prefix is bound to the xslt namespace, the default ns is not bound, 'other' ns is not in scope :)
        'other-default-namespace',    (: the default namespace is bound in the static and dynamic variables to something else, the 'other' ns is not in scope, the 'xsl' ns is as normal :) 
        'switch-xsl-namespace'        (: the 'xsl' prefix is bound to something else, the 'other' prefix is bound to the xslt namespace, the default ns is not bound :) 
        )[3] "/>

    <xsl:include href="system-property-100-data.xsl" />
    <xsl:include href="system-property-100-sc-normal.xsl" />
    <xsl:include href="system-property-100-sc-other.xsl" />
    <xsl:include href="system-property-100-sc-switch.xsl" />
    <xsl:include href="system-property-100-dc-normal.xsl" />
    <xsl:include href="system-property-100-dc-other.xsl" />
    <xsl:include href="system-property-100-dc-switch.xsl" />
    <xsl:include href="system-property-100-core.xsl" />


    <xsl:template name="xsl:initial-template">
        <xsl:variable name="all-sc" select="$sc:ref-ref, $sc:partial-ref, $sc:anon-ref, $sc:lookup-ref, $sc:anon-ref-all" use-when="$d:eval-static"/>
        <xsl:variable name="all-dc" select="$dc:ref-ref, $dc:partial-ref, $dc:anon-ref, $dc:lookup-ref, $dc:anon-ref-all" />
        
        <output evaluation-method="{$method}" eval-static-variables="{$d:eval-static}" ns-normal="{$ns-normal}">
            <!-- no frills: -->
            <global-variables>
                <!-- direct call to a static variable, display results -->
                <static-context xsl:use-when="$d:eval-static">
                    <static-call result-for="{$v:static-call}">{$sc:static-call}</static-call>
                    <ref-call result-for="{$v:ref-call}">{$sc:ref-call}</ref-call>
                    <let-call result-for="{$v:let-call}">{$sc:let-call}</let-call>
                    <anon-call result-for="{$v:anon-call}">{$sc:anon-call}</anon-call>
                    <partial-call result-for="{$v:partial-call}">{$sc:partial-call}</partial-call>
                    <lookup-call result-for="{$v:lookup-call}">{$sc:lookup-call}</lookup-call>
                </static-context>
                <!-- direct call to a dynamic variable, display results -->
                <dynamic-context>
                    <static-call result-for="{$v:static-call}">{$dc:static-call}</static-call>
                    <ref-call result-for="{$v:ref-call}">{$dc:ref-call}</ref-call>
                    <let-call result-for="{$v:let-call}">{$dc:let-call}</let-call>
                    <anon-call result-for="{$v:anon-call}">{$dc:anon-call}</anon-call>
                    <partial-call result-for="{$v:partial-call}">{$dc:partial-call}</partial-call>
                    <lookup-call result-for="{$v:lookup-call}">{$dc:lookup-call}</lookup-call>
                </dynamic-context>
            </global-variables>
            
            <!-- evaluation in xsl:evaluate -->
            <xsl:if test="$method = 'evaluate'">
                <evaluate-direct raises="{$d:eval-direct-error}">
                   <static-call result-for="{$v:static-call}">{f:evaluate-direct-or-fail($v:static-call)}</static-call>
                   <static-call result-for="{$v:ref-call}">{f:evaluate-direct-or-fail($v:ref-call)}</static-call>
                   <static-call result-for="{$v:let-call}">{f:evaluate-direct-or-fail($v:let-call)}</static-call>
                   <static-call result-for="{$v:anon-call}">{f:evaluate-direct-or-fail($v:anon-call)}</static-call>
                   <static-call result-for="{$v:partial-call}">{f:evaluate-direct-or-fail($v:partial-call)}</static-call>
                </evaluate-direct>
                <evaluate-ref raises="{$d:eval-ref-error}">
                    <static-context xsl:use-when="$d:eval-static">
                       <dynamic-call eval-arg-set-to="{$v:function-ref}"><xsl:copy-of select="f:evaluate-ref-or-fail($sc:ref-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-partial}"><xsl:copy-of select="f:evaluate-ref-or-fail($sc:partial-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-anon}"><xsl:copy-of select="f:evaluate-ref-or-fail($sc:anon-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-lookup}"><xsl:copy-of select="f:evaluate-ref-or-fail($sc:lookup-ref)" /></dynamic-call>
                       <dynamic-call-all><xsl:copy-of select="f:evaluate-ref-or-fail($sc:anon-ref-all)" /></dynamic-call-all>
                    </static-context>
                    <dynamic-context>
                       <dynamic-call eval-arg-set-to="{$v:function-ref}"><xsl:copy-of select="f:evaluate-ref-or-fail($dc:ref-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-partial}"><xsl:copy-of select="f:evaluate-ref-or-fail($dc:partial-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-anon}"><xsl:copy-of select="f:evaluate-ref-or-fail($dc:anon-ref)" /></dynamic-call>
                       <dynamic-call eval-arg-set-to="{$v:function-lookup}"><xsl:copy-of select="f:evaluate-ref-or-fail($dc:lookup-ref)" /></dynamic-call>
                       <dynamic-call-all><xsl:copy-of select="f:evaluate-ref-or-fail($dc:anon-ref-all)" /></dynamic-call-all>
                    </dynamic-context>
                </evaluate-ref>
            </xsl:if>
    
            <xsl:if test="$method = 'apply-templates'">
               <static-context method="apply-templates" xsl:use-when="$d:eval-static">
                   <xsl:apply-templates select="$all-sc" />
               </static-context>
               <dynamic-context method="apply-templates">
                   <xsl:apply-templates select="$all-dc" />
               </dynamic-context>
            </xsl:if>
            
            <xsl:if test="$method = 'stylesheet-function'">
                <static-context method="stylesheet-function" xsl:use-when="$d:eval-static">
                    <xsl:copy-of select="$all-sc ! f:test(.)" />
                </static-context>
               <dynamic-context method="stylesheet-function">
                   <xsl:copy-of select="$all-dc ! f:test(.)" />
               </dynamic-context>
            </xsl:if>
            
            <xsl:if test="$method = 'tunneled'">
                <static-context method="tunneled-param" xsl:use-when="$d:eval-static">
                    <xsl:apply-templates select="$all-sc" mode="tunnel">
                        <xsl:with-param name="f" tunnel="yes" select="$all-sc" />
                    </xsl:apply-templates>
                </static-context>
                <dynamic-context method="tunneled-param">
                    <xsl:apply-templates select="$all-dc" mode="tunnel">
                        <xsl:with-param name="f" tunnel="yes" select="$all-dc" />
                    </xsl:apply-templates>
                </dynamic-context>
            </xsl:if>            
        </output>
    </xsl:template>
    
</xsl:stylesheet>


