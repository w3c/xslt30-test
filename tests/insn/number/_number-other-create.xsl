<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog" 
    xmlns:d="http://data"
    xpath-default-namespace="http://data" 
    exclude-result-prefixes="xs math d" version="3.0">

    <!-- 
        This stylesheet is used to auto-create numbering styles in the Number, Other Unicode category
        and takes supported ranges into account.
        It should be called with itself as input.
    -->

    <xsl:output indent="yes" use-character-maps="indent-after-comment" encoding="utf-8" />
    
    <xsl:character-map name="indent-after-comment">
        <xsl:output-character character="&#xABCD;" string="&#xA;            "/>
        <xsl:output-character character="&#xABCE;" string="&#xA;      "/>
    </xsl:character-map>
    
    <d:data>
        <d:number-system>
            <d:name>CIRCLED DIGIT ONE</d:name>
            <d:combinations>0 to 9, 1 to 9, 0 to 10, 1 to 10, 0 to 20, 1 to 20, 0 to 50, 1 to 50</d:combinations>
            <d:format> ①</d:format>
            <d:range from="0" from-char="⓪" />
            <d:range from="1" to="20" from-char="①" />
            <d:range from="21" to="35" from-char="㉑" />
            <d:range from="36" to="50" from-char="㊱" />
        </d:number-system>
        <d:number-system>
            <d:name>PARENTHESIZED DIGIT ONE</d:name>
            <d:combinations>1 to 9, 1 to 10, 1 to 20</d:combinations>
            <d:format> ⑴</d:format>
            <d:range from="1" to="20" from-char="⑴" />
        </d:number-system>
        <d:number-system>
            <d:name>DIGIT ONE FULL STOP</d:name>
            <d:combinations>0 to 9, 1 to 9, 0 to 10, 1 to 10, 0 to 10, 1 to 20</d:combinations>
            <d:format> ⒈</d:format>
            <d:range from="0" from-char="&#127232;" />
            <d:range from="1" to="20" from-char="⒈" />
        </d:number-system>
        <d:number-system>
            <d:name>DINGBAT NEGATIVE CIRCLED DIGIT ONE</d:name>
            <d:combinations>0 to 9, 1 to 9, 0 to 10, 1 to 10, 0 to 10, 1 to 20</d:combinations>
            <d:format> ❶</d:format>
            <d:range from="0" from-char="&#9471;" />
            <d:range from="1" to="10" from-char="❶" />
            <d:range from="11" to="20" from-char="⓫" />
        </d:number-system>
        <d:number-system>
            <d:name>DOUBLE CIRCLED DIGIT ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> ⓵</d:format>
            <d:range from="1" to="10" from-char="⓵" />
        </d:number-system>
        <d:number-system>
            <d:name>DINGBAT CIRCLED SANS-SERIF DIGIT ONE</d:name>
            <d:combinations>0 to 9, 1 to 9, 0 to 10, 1 to 10</d:combinations>
            <d:format> ➀</d:format>
            <d:range from="0" from-char="&#127243;" />
            <d:range from="1" to="10" from-char="➀" />
        </d:number-system>
        <d:number-system>
            <d:name>DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT ONE</d:name>
            <d:combinations>0 to 9, 1 to 9, 0 to 10, 1 to 10</d:combinations>
            <d:format> ➊</d:format>
            <d:range from="0" from-char="&#127244;" />
            <d:range from="1" to="10" from-char="➊" />
        </d:number-system>
        <d:number-system>
            <d:name>PARENTHESIZED IDEOGRAPH ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> ㈠</d:format>
            <d:range from="1" to="10" from-char="㈠" />
        </d:number-system>
        <d:number-system>
            <d:name>CIRCLED IDEOGRAPH ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> ㊀</d:format>
            <d:range from="1" to="10" from-char="㊀" />
        </d:number-system>
        <d:number-system>
            <d:name>AEGEAN NUMBER ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> &#65799;</d:format>
            <d:range from="1" to="10" from-char="&#65799;" />
        </d:number-system>
        <d:number-system>
            <d:name>COPTIC EPACT DIGIT ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> &#66273;</d:format>
            <d:range from="1" to="10" from-char="&#66273;" />
        </d:number-system>
        <d:number-system>
            <d:name>RUMI DIGIT ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> &#69216;</d:format>
            <d:range from="1" to="10" from-char="&#69216;" />
        </d:number-system>
        <d:number-system>
            <d:name>BRAHMI NUMBER ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> &#69714;</d:format>
            <d:range from="1" to="10" from-char="&#69714;" />
        </d:number-system>
        <d:number-system>
            <d:name>SINHALA ARCHAIC DIGIT ONE</d:name>
            <d:combinations>1 to 9, 1 to 10</d:combinations>
            <d:format> &#70113;</d:format>
            <d:range from="1" to="10" from-char="&#70113;" />
        </d:number-system>
        <d:number-system>
            <d:name>COUNTING ROD UNIT DIGIT ONE</d:name>
            <d:combinations>1 to 9</d:combinations>
            <d:format> &#119648;</d:format>
            <d:range from="1" to="9" from-char="&#119648;" />
        </d:number-system>
        <d:number-system>
            <d:name>MENDE KIKAKUI DIGIT ONE</d:name>
            <d:combinations>1 to 9</d:combinations>
            <d:format> &#125127;</d:format>
            <d:range from="1" to="9" from-char="&#125127;" />
        </d:number-system>
        <d:number-system>
            <d:name>DIGIT ONE COMMA</d:name>
            <d:combinations>0 to 9, 1 to 9</d:combinations>
            <d:format> &#127234;</d:format>
            <d:range from="0" from-char="&#127233;" />
            <d:range from="1" to="9" from-char="&#127234;" />
        </d:number-system>
    </d:data>
    <xsl:template match="/">        
        <xsl:variable name="result">
            <xsl:apply-templates select="*/data/number-system"/>
        </xsl:variable>
        
        <test-set>
            <xsl:apply-templates select="$result/*" mode="post-proc"/>
        </test-set>
    </xsl:template>
    
    <xsl:template match="test-case" mode="post-proc" xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog">
        <xsl:value-of select="'&#xA;&#xA;'" />
        <xsl:copy>
            <xsl:variable name="seq-number" as="xs:integer">
                <xsl:number />
            </xsl:variable>
            <xsl:attribute name="name" select="'number-' || $seq-number + 5000" />
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="number-system" priority="10">
        <xsl:variable name="node" select="." />
        <xsl:for-each select="tokenize(combinations, ', ')">
            <xsl:apply-templates select="$node" mode="numbering">
                <xsl:with-param name="range" select="." />
            </xsl:apply-templates>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="number-system" mode="numbering" expand-text="yes">
        <xsl:param name="range" />
        <xsl:variable name="from" select="tokenize($range, ' to ')[1]" />
        <xsl:variable name="to" select="tokenize($range, ' to ')[2]" />

        <test-case>
            <xsl:value-of select="'&#xA;'" />
            <xsl:comment>This test was converted from Exselt and is auto-generated using _number-other-create.xsl</xsl:comment>
            <!-- working around an indentation bug -->
            <xsl:value-of select="'&#xABCE;'" />
            <description>Numbering using '{name}' with matching range (tested range matches exact with supported range)</description>
            <created by="Abel Braaksma" on="2015-05-16" />
            <environment ref="number-06" />
            <dependencies>
                <spec value="XSLT10+" />
                <combinations_for_numbering value="{name}" range="{$range}" />
            </dependencies>
            <test>
                <stylesheet file="number-5000.xsl" />
                <param name="from" as="xs:integer" select="{$from}" />
                <param name="to" as="xs:integer" select="{$to}" />
                <param name="format-string" as="xs:string" select="'{format}'" />
            </test>
            <result>
                <assert-string-value>
                    <xsl:apply-templates select="range">
                        <xsl:with-param name="from" select="xs:integer($from)" as="xs:integer"/>
                        <xsl:with-param name="to" select="xs:integer($to)" as="xs:integer" />
                    </xsl:apply-templates>
                </assert-string-value>
            </result>
        </test-case>

    </xsl:template>
    
    <xsl:template match="number-system" mode="numbering" expand-text="yes">
        <xsl:param name="range" />
        <xsl:variable name="from" select="tokenize($range, ' to ')[1]" />
        <xsl:variable name="to" select="tokenize($range, ' to ')[2]" />

        <test-case>
            <xsl:value-of select="'&#xA;'" />
            <xsl:comment>This test is auto-generated using _number-other-create.xsl</xsl:comment>
            <!-- working around an indentation bug -->
            <xsl:value-of select="'&#xABCE;'" />
            <description>Numbering using '{name}' with overflowing range (tested range overflows the supported range)</description>
            <created by="Abel Braaksma" on="2015-05-16" />
            <environment ref="number-06" />
            <dependencies>
                <spec value="XSLT10+" />
                <combinations_for_numbering value="{name}" range="{$range}" />
            </dependencies>
            <test>
                <stylesheet file="number-5000.xsl" />
                <param name="from" as="xs:integer" select="{0}" />
                <param name="to" as="xs:integer" select="{xs:integer($to) + 5}" />
                <param name="format-string" as="xs:string" select="'{format}'" />
            </test>
            <result>
                <xsl:choose>
                    <xsl:when test="xs:double($to) = max(range/@to) and $from = '0'">
                        <assert-string-value>
                            <xsl:apply-templates select="range">
                                <xsl:with-param name="from" select="0" as="xs:integer"/>
                                <xsl:with-param name="to" select="xs:integer($to) + 5" as="xs:integer" />
                            </xsl:apply-templates>
                            <xsl:sequence select="xs:integer($to) + 1 to xs:integer($to) + 5" />
                        </assert-string-value>
                    </xsl:when>
                    <xsl:when test="xs:double($to) = max(range/@to) and $from != '0' and xs:double($from) = min(range/@from)">
                        <assert-string-value>
                            <xsl:sequence select="if ($from != '0') then 0 else ()" />
                            <xsl:apply-templates select="range">
                                <xsl:with-param name="from" select="xs:integer($from)" as="xs:integer"/>
                                <xsl:with-param name="to" select="xs:integer($to) + 5" as="xs:integer" />
                            </xsl:apply-templates>
                            <xsl:sequence select="xs:integer($to) + 1 to xs:integer($to) + 5" />
                        </assert-string-value>
                    </xsl:when>
                    <xsl:otherwise>
                        <any-of>
                            <xsl:value-of select="'&#xA;'" />
                            <xsl:comment>If a processor supports 0 to 1000, it also supports 1 to 9, 0 to 20 etc, unless range is implied by Unicode range</xsl:comment>
                            <!-- working around an indentation bug -->
                            <xsl:value-of select="'&#xABCD;'" />
                            <xsl:if test="$from = '1' and min(range/@from) = 0">
                                <!-- processor supports from 1 to higher than $to, add alternate range with zero as normal digit --> 
                                <assert-string-value>
                                   <xsl:sequence select="0" />
                                   <xsl:apply-templates select="range">
                                       <xsl:with-param name="from" select="1" as="xs:integer"/>
                                       <xsl:with-param name="to" select="xs:integer($to) + 5" as="xs:integer" />
                                   </xsl:apply-templates>
                                   <xsl:sequence select="if (max(range/@to) = xs:double($to)) then xs:integer($to) + 1 to xs:integer($to) + 5 else ()" />
                                </assert-string-value>                                
                            </xsl:if>
                            <assert-string-value>
                                <!-- processor supports from 0 to higher than $to, add alternate range with zero as special digit -->
                                <xsl:sequence select="if (min(range/@from) != 0) then 0 else ()" />
                                <xsl:apply-templates select="range">
                                    <xsl:with-param name="from" select="0" as="xs:integer"/>
                                    <xsl:with-param name="to" select="xs:integer($to) + 5" as="xs:integer" />
                                </xsl:apply-templates>
                                <xsl:sequence select="if (max(range/@to) &lt; xs:double($to) + 5) then xs:integer(max(range/@to)) + 1 to xs:integer($to) + 5 else ()" />
                            </assert-string-value>
                            <xsl:if test="xs:double($to) != max(range/@to)">
                                <assert-string-value>
                                    <!-- processor supports from 1 to $to, add alternate range with zero and rest of range as normal digits -->
                                    <xsl:sequence select="if (min(range/@from) != 0) then 0 else ()" />
                                    <xsl:sequence select="if (min(range/@from) = 0 and $from != '0') then 0 else ()" />
                                    <xsl:apply-templates select="range">
                                        <xsl:with-param name="from" select="xs:integer($from)" as="xs:integer"/>
                                        <xsl:with-param name="to" select="xs:integer($to)" as="xs:integer" />
                                    </xsl:apply-templates>
                                    <xsl:sequence select="xs:integer($to) + 1 to xs:integer($to) + 5" />
                                </assert-string-value>
                            </xsl:if>
                        </any-of>
                    </xsl:otherwise>
                </xsl:choose>
            </result>
        </test-case>
        <xsl:next-match>
            <xsl:with-param name="range" select="$range" />
        </xsl:next-match>
    </xsl:template>
    
    <xsl:template match="range" expand-text="yes">
        <xsl:param name="from" as="xs:integer" />
        <xsl:param name="to" as="xs:integer"/>
        <xsl:variable name="node" select="." />
        <xsl:variable name="intersect" select="(@from to (@to, 0)[1])[. = $from to $to]" />
        <xsl:if test="not(empty($intersect))">
            <xsl:for-each select="$intersect">
                <xsl:sequence select="codepoints-to-string(string-to-codepoints($node/@from-char) + position() - 1)" />
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
