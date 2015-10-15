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
        $prefix:       the prefix to be used with the function literal ('', 'xpath:' or 'Q{http://www.w3.org/2005/xpath-functions}')
        $property:     the argument to be used in system-property
        $result:       the items the resulting function call succeed for, i.e. '' or '3.0', '3.1'
        $method:       see below for details on the method
        $ns-scope:     determines what namespaces are in scope for the static and dynamic 
                       global variables, for use with ns-sensitive functions:
                       * normal:                  'xsl' is bound to the xsl namespace, 'other' is not defined, default ns is not defined
                       * other-default-namespace: 'xsl' is bound to the xsl ns, 'other' is not defined, default namespace is set to http://other
                       * switch-xsl-namespace     'xsl' is bound to something wrong, 'other' is bound to the xsl ns, default ns is not defined.
        
        If any of these tests fail, the result contains additional info, unless a static error occurred.
        
        
        
        Available methods and their intentions:
        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
        all:                    For all tests, the following applies
                                * tests the value when evaluating a direct call (that is, no indirection through variables holding function items)
                                * tests, if $eval-static is true, evaluation as function items in static expression contexts
                                * tests the evaluation as function items in the dynamic expression context
                                * function literal depends on $prefix, which expands to a no-namespace, QName or an EQName version of the function name
                                * all tests test the following in a global variable of the SC and DC
                                    * a static call: function-name(var)
                                    * a ref call: function-name#1(var)
                                    * a let call: let $f := function-name#1 return $f(var)
                                    * an anon call: function() { function-name(var) } ()
                                    * a partial call: function-name(?)(var)
                                    * a lookup call: let $f := function-lookup(qname, argcnt) return $f(var)
                                * all tests test whether the result is as expected
                                
                                
        static:                 as above described for "all"
        
        evaluate:               in addition to "all":
                                * tests direct calls of strings-as-xpath in the xsl:evaluate/@xpath attribute
                                    * static call
                                    * ref call
                                    * let call
                                    * anon call
                                    * partial call
                                    * (lookup call is not evaluated, as it may return an empty sequence when others would return an error)
                                * tests indirect calls with an xsl:with-param set to a function item coming from SC and DC global vars
                                    * function reference, with-param set to function-name#1
                                    * partial function application, with-param set to function-name(?)
                                    * anonomous function, with-param set to function() { function-name(var) }
                                    * lookup function, with-param set to function-lookup(qname, argcnt)
                                    
                                The result contains information on the actual XPath used and the expression 
                                used to evaluate the function item with-param.
                                    
        apply-templates:        applies the function items from DC and SC to templates 
                                The templates match the function items based on arity, where a zero-arity function
                                is defined to return itself the four variants of the function items (<result-all>)
                                The function items are the same as the four function items for DC and SC described
                                under the "evaluate" method.
        tunneled:               Same as apply-templates, but uses the function items from DC and SC as 
                                a tunneled parameter that goes over one matching template without the tunneled
                                param defined, and a subsequent template with these tunneled params defined.
                                It deliberately uses a non-tunnel parameter with the same name as the tunnel parameter.
        stylesheet-function:    Calls a stylesheet function with the function items from DC and SC as arguments
        
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
    <xsl:param name="prefix" static="yes" select="''"/>

    <xsl:include href="system-property-100-data.xsl" />         <!-- abstraction and parsing of the <data:test> element -->
    <xsl:include href="system-property-100-sc-normal.xsl" />    <!-- static context for 'normal' namespace scope -->
    <xsl:include href="system-property-100-sc-other.xsl" />     <!-- static context for 'other-default-namesapce' namespace scope -->
    <xsl:include href="system-property-100-sc-switch.xsl" />    <!-- static context for 'switch-xsl-namespace' namespace scope -->
    <xsl:include href="system-property-100-dc-normal.xsl" />    <!-- dynamic context for 'normal' namespace scope -->
    <xsl:include href="system-property-100-dc-other.xsl" />     <!-- dynamic context for 'other-default-namesapce' namespace scope -->
    <xsl:include href="system-property-100-dc-switch.xsl" />    <!-- dynamic context for 'switch-xsl-namespace' namespace scope -->
    <xsl:include href="system-property-100-core.xsl" />         <!-- templates, stylesheet functions -->


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


