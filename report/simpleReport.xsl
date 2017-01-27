<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:f="http://myfunction"
    xmlns:r="http://www.w3.org/2012/11/xslt30-test-results"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog" 
    version="3.0"
    expand-text="true">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:variable name="catalog" select="document('../catalog.xml')"/>
    <xsl:variable name="test-sets" select="$catalog//test-set/@file[not(starts-with(., 'tests/sandp/'))]/document(.)"/>
    <xsl:variable name="test-cases" select="$test-sets/*/test-case"/>
    
    <xsl:variable name="results" as="element(result)*" xpath-default-namespace="">
        <result name="Saxon 9.7">file:/Users/mike/w3c/xslt30-test-saxon/results_XSLT3.0_9.7.0.7-2016-08-16.xml</result>
        <result name="Saxon 9.8">file:/Users/mike/w3c/xslt30-test-saxon/results_XSLT3.0_9.8.0.1-2016-12-16.xml</result>
    </xsl:variable>
    
    <xsl:function name="f:is30" as="xs:boolean">
        <xsl:param name="test" as="element(test-case)"/>
        <xsl:sequence select="not($test/(dependencies|../dependencies)/spec/@value[contains(., 'XSLT20') and not(contains(., 'XSLT20+') or contains(., 'XSLT30'))])"/>
    </xsl:function>
    
    <xsl:variable name="categories" as="map(*)*">
        <xsl:sequence select="map{'name':'all', 'filter': function($testcase) { f:is30($testcase) }}"/>
        <xsl:sequence select="map{'name':'basic conformance', 'filter': function($testcase) { f:is30($testcase) and not($testcase/(dependencies|../dependencies)/feature)}}"/>
        <xsl:sequence select="map{'name':'streaming', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='streaming' }}"/>
        <xsl:sequence select="map{'name':'dynamic evaluation', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='dynamic_evaluation' }}"/>
        <xsl:sequence select="map{'name':'higher order functions', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='higher_order_functions' }}"/>
        <xsl:sequence select="map{'name':'1.0 compatibility', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='backwards_compatibility' }}"/>
        <xsl:sequence select="map{'name':'serialization', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='serialization' }}"/>       
        <xsl:sequence select="map{'name':'schema aware', 'filter': function($testcase) { $testcase/(dependencies|../dependencies)/feature/@value='schema_aware' }}"/>
    </xsl:variable>
    
    <xsl:template name="xsl:initial-template">
        <html>
            <head>
                <title>XSLT 3.0 Test Results</title>
            </head>
            <body>
                <h1>XSLT 3.0 Test Results</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <td rowspan="2">Category</td>
                            <td rowspan="2"># of Tests</td>
                            <xsl:for-each select="$results">
                                <td colspan="3">{@name}</td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <xsl:for-each select="$results">
                                <td>Passed</td>
                                <td>Failed</td>
                                <td>Not Run</td>
                            </xsl:for-each>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="$categories">
                            <tr>
                                <xsl:variable name="category" select="."/>
                                <td>{?name}</td>
                                <td>{f:total(?filter)}</td>
                                <xsl:for-each select="$results">
                                    <xsl:variable name="score" select="f:score(string(.), $category?filter)" as="map(*)"/>
                                    <td>{$score?passed}</td>
                                    <td>{$score?failed}</td>
                                    <td>{$score?notrun}</td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:function name="f:total" as="xs:integer">
        <xsl:param name="filter" as="function(element(test-case)) as xs:boolean"/>
        <xsl:sequence select="count($test-cases[$filter(.)])"/>
    </xsl:function>

   <xsl:function name="f:score" as="map(*)">
       <xsl:param name="results-uri" as="xs:string"/>
       <xsl:param name="filter" as="function(element(test-case)) as xs:boolean"/>
       <xsl:variable name="selected" select="$test-cases[$filter(.)]/@name"/>
       <xsl:variable name="results" select="doc($results-uri)//r:test-case"/>
       <xsl:map>
           <xsl:map-entry key="'passed'" select="count($results[@name = $selected][@result=('pass', 'wrongError')])"/>
           <xsl:map-entry key="'failed'" select="count($results[@name = $selected][@result='fail'])"/>
           <xsl:map-entry key="'notrun'" select="count($results[@name = $selected][@result='notRun']) + 
               count($selected[let $n := . return not($results[@name = $n])])"/>
       </xsl:map>      
   </xsl:function>
</xsl:stylesheet>
