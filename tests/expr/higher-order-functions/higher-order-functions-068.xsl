<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://local/"
    exclude-result-prefixes="xs f"
    version="3.0">
    
    <!-- inline function literal, used-defined function -->
    
    <xsl:function name="f:fib">
        <xsl:param name="n" as="xs:integer" />
        <xsl:param name="countfun" as="function(*)" />
       
        <xsl:sequence select="
            if ($n = 1 or $n = 2)
            then $countfun(1)
            else let $first :=
                     function($x as xs:integer) as function(*)
                     {
                        let $second := function($y as xs:integer) as function(*)
                        {
                            $countfun($x + $y)
                        }
                        return f:fib($n - 2, $second)
                     }
                 return f:fib($n - 1, $first)" />
    </xsl:function>

    <xsl:template name="main">
        <out><xsl:value-of select="f:fib(10, function($a as xs:integer){$a})" /></out>
    </xsl:template>
    
</xsl:stylesheet>