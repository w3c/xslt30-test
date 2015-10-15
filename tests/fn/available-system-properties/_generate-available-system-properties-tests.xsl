<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0" expand-text="yes">

    <xsl:output cdata-section-elements="assert-xml" indent="yes" />

    <xsl:template name="xsl:initial-template">
        <xsl:variable name="props" select="
                    ('version',
                    'vendor',
                    'vendor-url',
                    'product-name',
                    'product-version',
                    'is-schema-aware',
                    'supports-serialization',
                    'supports-backwards-compatibility',
                    'supports-namespace-axis',
                    'supports-streaming',
                    'supports-dynamic-evaluation',
                    'xpath-version',
                    'xsd-version')" />
        <test-set>
            <xsl:apply-templates select="$props" />
            <xsl:apply-templates select="$props" mode="with-system-property"/>
        </test-set>
    </xsl:template>

    <xsl:template match=".">
        <test-case name="available-system-properties-0{format-number(position()+ 2, '00')}">
            <description>Tests whether available-system-properties returns a proper QName of xsl:{.}</description>
            <created by="Abel Braaksma" on="2015-10-12" />
            <dependencies>
                <spec value="XSLT30+" />
            </dependencies>
            <test>
                <stylesheet file="available-system-properties-002.xsl" />
                <param name="propname" as="xs:string" select="'{.}'" />
            </test>
            <result>
                <assert-xml><![CDATA[<result>Q{{http://www.w3.org/1999/XSL/Transform}}{.}</result>]]></assert-xml>
            </result>
        </test-case>
    </xsl:template>

    <xsl:template match="." mode="with-system-property">
        <test-case name="available-system-properties-0{format-number(position()+ 15, '00')}">
            <description>Tests whether available-system-properties returns a proper QName of xsl:{.} *and* returns the same value with system-property</description>
            <created by="Abel Braaksma" on="2015-10-12" />
            <dependencies>
                <spec value="XSLT30+" />
            </dependencies>
            <test>
                <stylesheet file="available-system-properties-003.xsl" />
                <param name="propname" as="xs:string" select="'{.}'" />
            </test>
            <result>
                <assert-xml><![CDATA[<result>true</result>]]></assert-xml>
            </result>
        </test-case>
    </xsl:template>

</xsl:stylesheet>
