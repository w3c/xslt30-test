<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.w3.org/1999/XSL/TransformAlias"
    xmlns:c="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="c xs"
    expand-text="yes"
    version="3.0">
    
    <xsl:param name="spec-uri" as="xs:string" required="yes"/>
    <xsl:variable name="spec" select="doc($spec-uri)"/>
    
    <xsl:variable name="test-set" as="document-node()" select="/"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:mode name="copy-tests" on-no-match="shallow-copy"/>
    <xsl:mode name="error-desc" />
    
    <xsl:variable name="tested-codes" select="distinct-values(//error/@code)"/>
    
    <xsl:variable name="all-errors" select="$spec//error"/>
    
    <xsl:namespace-alias stylesheet-prefix="t" result-prefix="xsl"/>
    
    <xsl:output method="xml" indent="yes" saxon:double-space="c:test-case" cdata-section-elements="c:content" xmlns:saxon="http://saxon.sf.net/"/>
    
    <xsl:template match="/">
        <xsl:message>Bad error codes: {$tested-codes[not(. = $all-errors/@code)]}</xsl:message>
        <test-set xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
            name="error-code">
            
            <description>
                Tests error conditions. 
                This test set should include a test for every error code (however, coverage of new XSLT 3.0 errors is incomplete).
            </description>
            
            <environment name="error001">
                <source role=".">
                    <content><![CDATA[<doc>
  <element attribute="3"/>
</doc>]]></content>
                </source>
            </environment>
            
            <environment name="error152">
                <source role=".">
                    <content><![CDATA[ 
                        
<doc>
    <item val="1"/>
    <item val="2"/>
    <item val="3"/>
    <item val="4"/>
    <item val="5"/>                
</doc>]]></content>
                </source>
            </environment>
            
            <environment name="error214">
                <source role=".">
                    <content><![CDATA[<t04>
  <a id="a" code="1" value="10"/>
  <a id="b" code="2" value="20"/>
  <a id="c" code="2" value="30"/>
  <a id="d" code="1" value="40"/>
</t04>]]></content>
                </source>
            </environment>
            
            
        <xsl:for-each-group select="$all-errors" group-by="@code">
            <xsl:sort select="@code"/>
            <xsl:variable name="full-code" select="concat(@spec, @class, @code)"/>
            <xsl:variable name="short-code" select="@code"/>
            <xsl:variable name="existing" select="$test-set//c:test-case[.//c:error/@code = $full-code]"/>
            <xsl:variable name="desc">
                <!--<xsl:value-of select="."/>-->
                <xsl:apply-templates select="." mode="error-desc"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="exists($existing)">
                    <xsl:apply-templates select="$existing" mode="copy-tests">
                        <xsl:with-param name="full-code" select="$full-code" tunnel="yes"/>
                        <xsl:with-param name="error-desc" select="$desc" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <test-case name="error-{$short-code}a">
                        <description>Error: {$desc}</description>
                        <created by="Michael Kay" on="2014-08-25"/>
                        <dependencies>
                            <spec value="XSLT30+"/>
                        </dependencies>
                        <test>
                            <stylesheet file="error-{$short-code}a.xsl"/>
                            <initial-template name="main"/>
                        </test>
                        <result>
                            <error code="{$full-code}"/>
                        </result>
                    </test-case>
                    <xsl:result-document href="error-{$short-code}a.xsl" method="xml" indent="yes">
                        <t:stylesheet version="3.0">
                            <xsl:comment>
                                <xsl:copy-of select="$desc"/>
                            </xsl:comment>
                            <t:template name="main">
                                <out xmlns="">
                                    <x/>
                                </out>
                            </t:template>
                        </t:stylesheet>
                    </xsl:result-document>   
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each-group>
        </test-set>
    </xsl:template>
    
    <xsl:template match="termref[not(node())]" mode="error-desc">
        <xsl:value-of select="$spec//termdef[@id = current()/@def]/@term"/>
    </xsl:template> 
    
    <xsl:template match="c:test-case" mode="copy-tests">
        <xsl:next-match>
            <xsl:with-param name="position" tunnel="yes">
                <xsl:number value="position()" format="a"/>
            </xsl:with-param>
        </xsl:next-match>
    </xsl:template>
    
    <xsl:template match="c:test-case/@name" mode="copy-tests">
        <xsl:param name="full-code" tunnel="yes"/>
        <xsl:param name="position" tunnel="yes"/>
        <xsl:attribute name="name">error-{substring($full-code, 5)}{$position}</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="c:description" mode="copy-tests">
        <xsl:param name="error-desc" tunnel="yes"/>
        <description><xsl:value-of select="."/>.&#xa;Was <xsl:value-of select="../@name"/>.&#xa;<xsl:value-of select="$error-desc"/></description>
    </xsl:template>
    
    <xsl:template match="c:stylesheet[not(@role='secondary')]/@file" mode="copy-tests">
        <xsl:param name="full-code" tunnel="yes"/>
        <xsl:param name="position" tunnel="yes"/>
        <xsl:attribute name="file">error-{substring($full-code, 5)}{$position}.xsl</xsl:attribute>
        <xsl:result-document href="error-{substring($full-code, 5)}{$position}.xsl">
            <xsl:apply-templates select="document(.)" mode="#current"/>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="/" mode="copy-tests">
        <xsl:param name="error-desc" tunnel="yes"/>
        <xsl:comment><xsl:copy-of select="$error-desc"/></xsl:comment>
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>