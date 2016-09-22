<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes" />
    
    <xsl:template name="xsl:initial-template">
        <root>
        <xsl:for-each select="'C', 'Cc', 'Cf', 'Cn', 'Co', 'Cs', 'L', 'LC', 'Ll', 'Lm', 'Lo', 'Lt', 'Lu', 'M', 'Mc', 'Me', 'Mn', 'N', 'Nd', 'Nl', 'No', 'P', 'Pc', 'Pd', 'Pe', 'Pf', 'Pi', 'Po', 'Ps', 'S', 'Sc', 'Sk', 'Sm', 'So', 'Z', 'Zl', 'Zp', 'Zs'" expand-text="yes">
            <xsl:variable name="category" select ="." />
            <xsl:for-each select="1 to 24">
                <xsl:variable name="testid" select="." />
                <test-case name="unicode90-{$category}-{if($testid le 9) then '00' else '0'}{$testid}">
                    <description>Tests general category '{$category}' with fn:matches</description>
                    <created by="Abel Braaksma" on="2016-09-08"/>
                    <environment>
                        <source file="docs/unicode-{$category}.xml" role="." />
                    </environment>
                    <test>
                        <stylesheet file="unicode90-Gen-001.xsl"/>
                        <initial-mode name="fn-matches{.}"/>
                    </test>
                    <result>
                        <assert>/res = 'true'</assert>
                    </result>
                </test-case>
                <xsl:text>&#xA;&#xA;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="1 to 2">
                <xsl:variable name="testid" select=". + 24" />
                <test-case name="unicode90-{$category}-{if($testid le 9) then '00' else '0'}{$testid}">
                    <description>Tests general category '{$category}' with fn:string-length</description>
                    <created by="Abel Braaksma" on="2016-09-08"/>
                    <environment>
                        <source file="docs/unicode-{$category}.xml" role="." />
                    </environment>
                    <test>
                        <stylesheet file="unicode90-Gen-001.xsl"/>
                        <initial-mode name="fn-string-length{.}"/>
                    </test>
                    <result>
                        <assert>/res = 'true'</assert>
                    </result>
                </test-case>
                <xsl:text>&#xA;&#xA;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="1 to 4">
                <xsl:variable name="testid" select=". + 26" />
                <test-case name="unicode90-{$category}-{if($testid le 9) then '00' else '0'}{$testid}">
                    <description>Tests general category '{$category}' with fn:translate</description>
                    <created by="Abel Braaksma" on="2016-09-08"/>
                    <environment>
                        <source file="docs/unicode-{$category}.xml" role="." />
                    </environment>
                    <test>
                        <stylesheet file="unicode90-Gen-001.xsl"/>
                        <initial-mode name="fn-translate{.}"/>
                    </test>
                    <result>
                        <assert>/res = 'true'</assert>
                    </result>
                </test-case>
            </xsl:for-each>
            <xsl:for-each select="1 to 8">
                <xsl:variable name="testid" select=". + 30" />
                <test-case name="unicode90-{$category}-{if($testid le 9) then '00' else '0'}{$testid}">
                    <description>Tests general category '{$category}' with fn:replace</description>
                    <created by="Abel Braaksma" on="2016-09-08"/>
                    <environment>
                        <source file="docs/unicode-{$category}.xml" role="." />
                    </environment>
                    <test>
                        <stylesheet file="unicode90-Gen-001.xsl"/>
                        <initial-mode name="fn-replace{.}"/>
                    </test>
                    <result>
                        <assert>/res = 'true'</assert>
                    </result>
                </test-case>
                <xsl:text>&#xA;&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        </root>
    </xsl:template>
    
</xsl:stylesheet>