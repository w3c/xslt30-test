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
    
    
    <xsl:template match=".[. instance of function(*)][function-arity(.) > 0]" >
        <result arity="{function-arity(.)}" name="{function-name(.)}">
            <xsl:value-of _select=".{$d:paren-args}"/>
        </result>
    </xsl:template>

    <xsl:template match=".[. instance of function(*)][function-arity(.) = 0]" >
        <result-all>
            <xsl:value-of _select=".() ! .{$d:paren-args}"/>
        </result-all>
    </xsl:template>
    
    <xsl:template match="." mode="tunnel">
        <xsl:apply-templates select="." mode="next-tunnel">
            <!-- this should not tamper with our tunneled param -->
            <xsl:with-param name="f" tunnel="no" select="." />
            <xsl:with-param name="pos" select="position()" />
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match=".[. instance of function(*)]" mode="next-tunnel">
        <xsl:param name="f" as="function(*)*" tunnel="yes" />
        <xsl:param name="pos"  />
        <!-- zero-arity function is the anon function that returns a set of functions that each have normal parameters -->
        <xsl:if test="function-arity($f[$pos]) = 0">
            <result-all>
                <xsl:value-of _select="$f[$pos]() ! .{$d:paren-args}"/>
            </result-all>
        </xsl:if>
        <xsl:if test="function-arity($f[$pos]) > 0">
            <result pos="{$pos}" arity="{function-arity($f[$pos])}" name="{function-name($f[$pos])}">
                <xsl:value-of _select="$f[$pos]{$d:paren-args}"/>
            </result>
        </xsl:if>
    </xsl:template>

    <xsl:function name="f:test">
        <xsl:param name="f" as="function(*)" />
        <!-- zero-arity function is the anon function that returns a set of functions that each have normal parameters -->
        <xsl:if test="function-arity($f) = 0">
            <result-all>
                <xsl:value-of _select="$f() ! .{$d:paren-args}"/>
            </result-all>
        </xsl:if>
        <xsl:if test="function-arity($f) > 0">
            <result arity="{function-arity($f)}" name="{function-name($f)}">
                <xsl:value-of _select="$f{$d:paren-args}"/>
            </result>
        </xsl:if>
    </xsl:function>
    
    <!-- 
        function to call the direct expression (a static string that is 
        an XPath) from the test 
    -->
    <xsl:function name="f:evaluate-direct-or-fail">
        <xsl:param name="evalthis" as="xs:string" />
        
        <xsl:try>
            <xsl:evaluate xpath="$evalthis" />
            <xsl:catch _errors="NOTHING {tokenize($d:eval-direct-error, ' ') ! concat(' *:', .)}">
                <xsl:text>CAUGHT</xsl:text>
            </xsl:catch>
        </xsl:try>
    </xsl:function>

    <!-- 
        function to call a reference to a (static or dynamic variable bound to a) function, 
        itself set to a variable for xsl:evaluate.
        
        The function's try/catch is written such that it will (deliberately) fail to catch 
        anything if no explicit errors are defined.
    -->
    <xsl:function name="f:evaluate-ref-or-fail">
        <xsl:param name="function-item" as="function(*)" />
        
        
        <xsl:try>
          <!--
              zero arity function returns a sequence of function items of the 
              same signature as the function being tested
          -->
          <xsl:if test="function-arity($function-item) = 0">
              <xsl:variable name="xpath" select="'$f()!.' || $d:paren-args" />            
              <xsl:attribute name="eval-xpath" select="$xpath" />
              <xsl:evaluate xpath="$xpath">
                  <xsl:with-param name="f" select="$function-item" />
              </xsl:evaluate>
          </xsl:if>
          
          <!--
              gt-zero arity function "is-a" function item that is bound to a static or 
              dynamic global variable with the same signature as the function being tested
          -->
          <xsl:if test="function-arity($function-item) > 0">
              <xsl:variable name="xpath" select="'$f' || $d:paren-args" />            
              <xsl:attribute name="eval-xpath" select="$xpath" />
              <xsl:evaluate xpath="$xpath">
                  <xsl:with-param name="f" select="$function-item" />
              </xsl:evaluate>
          </xsl:if>
            <xsl:catch _errors="NOTHING {tokenize($d:eval-direct-error, ' ') ! concat(' *:', .)}">
                <xsl:text>CAUGHT</xsl:text>
            </xsl:catch>
        </xsl:try>
    </xsl:function>

</xsl:stylesheet>


