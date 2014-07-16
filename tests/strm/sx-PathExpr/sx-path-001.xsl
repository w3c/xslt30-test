<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="map xs">

    <!-- Test of xsl:stream with several root path expressions -->

    <xsl:param name="test-root1" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-root2" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-root-pred1" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-root-pred2" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-root-numpred" select="false()" static="yes" as="xs:boolean"/>
    
    <xsl:param name="test-rootelem" select="true()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-rootelem-self" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-rootelem-self-numpred" select="false()" static="yes" as="xs:boolean"/>
    <xsl:param name="test-doc-nodetest" select="false()" static="yes" as="xs:boolean"/>

    <xsl:variable name="docurl" select="'../docs/books.xml'"/>
   
    <xsl:variable name="doc" select="doc($docurl)"/>

    <!-- root expression "/" when context node is statically a root node -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-root1">
        <xsl:variable name="root">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of select="deep-equal($doc, $root)"/>
        </out>
    </xsl:template>
    
    <!-- root expression "root()" when context node is statically a root node -->

    <xsl:template name="xsl:initial-template" use-when="$test-root2">
        <xsl:variable name="root">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="root()"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of select="deep-equal($doc, $root)"/>
        </out>
    </xsl:template>
    
    <!-- root expression with motionless predicate -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-root-pred1">
        <xsl:variable name="root">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="(/)[self::node()]"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of select="deep-equal($doc, $root)"/>
        </out>
    </xsl:template>
    
    <!-- root expression with motionless predicate -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-root-pred2">
        <xsl:variable name="root">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="(/)[self::node() instance of document-node()]"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of select="deep-equal($doc, $root)"/>
        </out>
    </xsl:template>
    
    <!-- root expression with numeric predicate -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-root-numpred">
        <xsl:variable name="root">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="(/)[1]"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of select="deep-equal($doc, $root)"/>
        </out>
    </xsl:template>
    
    <!-- five variants of root expression with child-select, section 19.8.7.6 and 19.8.8.15 -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-rootelem">
        <xsl:variable name="root1">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/BOOKLIST"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root2">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root3">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/element()"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root4">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="root(.)/*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root5">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="(root(self::node()) treat as document-node())/*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root6">
            <xsl:stream href="{$docurl}">
                <!-- see 19.8.7.8 item (1) and bug#xxx -->
                <xsl:copy-of select="(//*)[1]"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of
                select="
                deep-equal($doc, $root1) and
                deep-equal($doc, $root2) and
                deep-equal($doc, $root3) and 
                deep-equal($doc, $root4) and
                deep-equal($doc, $root5) and
                deep-equal($doc, $root6)"/>
        </out>
    </xsl:template>
    
    <!-- five variants of root expression with child-select and motionless predicate, 
        section 19.8.7.6, 19.8.8.15 and 19.8.7.8 -->
    
    <xsl:template name="xsl:initial-template" use-when="$test-rootelem-self">
        <xsl:variable name="root1">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/BOOKLIST"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root2">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root3">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/element()"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root4">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="root(.)/*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root5">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="(root(self::node()) treat as document-node())/*"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of
                select="
                deep-equal($doc, $root1) and
                deep-equal($doc, $root2) and
                deep-equal($doc, $root3) and 
                deep-equal($doc, $root4) and
                deep-equal($doc, $root5)"/>
        </out>
    </xsl:template>
    
    <xsl:template name="xsl:initial-template" use-when="false()">
        <xsl:variable name="root2" as="element()">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/BOOKLIST"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root3" as="element()">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="*"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root4" as="element()">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/*/self::node()[1]"/>
            </xsl:stream>
        </xsl:variable>
        <xsl:variable name="root5" as="element()">
            <xsl:stream href="{$docurl}">
                <xsl:copy-of select="/*/self::node()[1]"/>
            </xsl:stream>
        </xsl:variable>
        <out>
            <xsl:value-of
                select="
                deep-equal($doc, $root1/*) and 
                deep-equal($doc, $root2/*) and
                deep-equal($doc, $root3/*) and 
                deep-equal($doc, $root4/*) and
                deep-equal($doc, $root5/*)"/>
            <xsl:copy-of select="$root5"/>
        </out>
    </xsl:template>
    
</xsl:stylesheet>
