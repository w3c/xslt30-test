<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:ext="http://example.com/extension-instructions-dont-exist"
    xmlns:my="http://myfunctions"
    xmlns:alias="http://alias-for-xslt"
    version="3.0">
    
    <!-- Purpose:  Generates tests based on allowed functions in static signatures
    -->
    
    <xsl:output indent="yes" />

    <xsl:namespace-alias stylesheet-prefix="alias" result-prefix="xsl"/>
    
    <xsl:mode on-no-match="shallow-skip" />
    
    <ext:non-existing>not an extension instruction, this is a data element</ext:non-existing>
    
    <xsl:function name="my:stylesheet-function">hello</xsl:function>
    
    <xsl:variable name="allowed">
        <function name="element-available" arity="1" success-value="{true()}" >
            <arguments-success>
                <arg>xsl:fork</arg>
            </arguments-success>
            <arguments-fail>
                <arg>ext:non-existing</arg>
            </arguments-fail>
        </function>
        <function name="function-available" arity="1" success-value="{true()}" >
            <arguments-success>
                <arg>fn:concat</arg>
            </arguments-success>
            <arguments-success>
                <arg>concat</arg>
            </arguments-success>
            <arguments-success>
                <arg>xs:dateTime</arg>
            </arguments-success>
            <arguments-fail>
                <arg>my:stylesheet-function</arg>
            </arguments-fail>
            <arguments-fail>
                <arg>fn:no-exist</arg>
            </arguments-fail>
        </function>
        <function name="function-available" arity="2" success-value="{true()}" >
            <arguments-success>
                <arg>fn:concat</arg>
                <arg as="xs:integer">4</arg>
            </arguments-success>
            <arguments-success>
                <arg>concat</arg>
                <arg as="xs:integer">5</arg>
            </arguments-success>
            <arguments-success>
                <arg>xs:dateTime</arg>
                <arg as="xs:integer">1</arg>
            </arguments-success>
            <arguments-fail>
                <arg>my:stylesheet-function</arg>
                <arg as="xs:integer">0</arg>
            </arguments-fail>
            <arguments-fail>
                <arg>fn:no-exist</arg>
                <arg as="xs:integer">6</arg>
            </arguments-fail>
        </function>
    </xsl:variable>

    <xsl:template name="xsl:initial-template">
        <xsl:result-document href="use-when-0600.xsl">
            <alias:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                 xmlns:xs="http://www.w3.org/2001/XMLSchema"
                 xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                 xmlns:ext="http://example.com/extension-instructions-dont-exist"
                 xmlns:my="http://myfunctions"
                 xmlns:alias="http://alias-for-xslt"
                 version="3.0">
                
                <alias:template name="xsl:initial-template">
                    <xsl:apply-templates select="$allowed" />
                </alias:template>
            </alias:transform>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="function">
        <function>
            <xsl:attribute name="alias:use-when">
                <xsl:value-of select="@name" />
                <xsl:value-of select="'#' || @arity" />
                <xsl:value-of select="' castable as function(*)'" />
            </xsl:attribute>
        </function>
    </xsl:template>
    
    <xsl:template match="@name">
        
    </xsl:template>
    
    <xsl:template match="@arity">
        <xsl:value-of select="'#' || ." />
    </xsl:template>
    
    <xsl:template match="@success-value">
        <xsl:value-of select="'= ()'" />
    </xsl:template>

</xsl:transform>
