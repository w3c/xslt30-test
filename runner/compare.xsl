<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:d="http://ns.saxonica.com/diff"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
  
    <xsl:function name="d:deep-equal" as="xs:boolean">
        <xsl:param name="a" as="node()"/>
        <xsl:param name="b" as="node()"/>
        <xsl:sequence select="exists(d:compare($a, $b)//d:DIFFERENCE)"/>
    </xsl:function>
    
    <xsl:function name="d:compare" as="node()*">
        <xsl:param name="a" as="node()"/>
        <xsl:param name="b" as="node()"/>
        <xsl:sequence select="d:compare($a, $b, '')"/>
    </xsl:function>
    
    <!-- 
       Compare two nodes, $a amd $b
       Flags: 'F': take prefixes into account.
    -->
    
    <xsl:function name="d:compare" as="node()*">
        <xsl:param name="a" as="node()"/>
        <xsl:param name="b" as="node()"/>
        <xsl:param name="flags" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="d:nodekind($a) != d:nodekind($b)">
                <xsl:sequence select="d:show-difference($a, $b, 'Different node kinds')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$a" mode="compare">
                    <xsl:with-param name="b" select="$b"/>
                    <xsl:with-param name="flags" select="$flags" tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="text()" mode="compare">
        <xsl:param name="b" as="text()"/>
        <xsl:choose>
            <xsl:when test="string(.) = string($b)">
                <xsl:value-of select="d:shorten-string(.)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="d:show-difference(., $b, 'Different text content')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="comment()" mode="compare">
        <xsl:param name="b" as="comment()"/>
        <xsl:choose>
            <xsl:when test="string(.) = string($b)">
                <xsl:comment select="d:shorten-string(.)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="d:show-difference(., $b, 'Different comment content')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" mode="compare">
        <xsl:param name="b" as="processing-instruction()"/>
        <xsl:choose>
            <xsl:when test="string(.) != string($b)">
                <xsl:sequence select="d:show-difference(., $b, 'Different PI content')"/>
            </xsl:when>
            <xsl:when test="name(.) != name($b)">
                <xsl:sequence select="d:show-difference(., $b, 'Different PI name')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:processing-instruction name="{name(.)}" select="d:shorten-string(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="element() | document-node()" mode="compare">
        <xsl:param name="b" as="node()"/>
        <xsl:param name="flags" as="xs:string" tunnel="yes"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="node-name(.) != node-name($b)">
                    <xsl:message>FIRST:  name: {name(.)} local: {local-name(.)}: uri: {namespace-uri(.)}</xsl:message>
                    <xsl:message>SECOND: name: {name($b)} local: {local-name($b)}: uri: {namespace-uri($b)}</xsl:message>
                    <xsl:sequence select="d:show-difference(., $b, 'Different element name')"/>
                </xsl:when>
                <xsl:when test="contains($flags, 'F') and name(.) != name($b)">
                    <xsl:sequence select="d:show-difference(., $b, 'Different prefix')"/>
                </xsl:when>
                <xsl:when test="not(deep-equal(d:sorted-attributes(.), d:sorted-attributes($b)))">
                    <xsl:sequence select="d:show-difference(., $b, 'Different attributes')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:iterate select="child::node()">
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:variable name="other" select="$b/child::node()[$pos]"/>
                        <xsl:choose>
                            <xsl:when test="empty($other)">
                                <xsl:sequence select="d:show-difference(., (), 'First tree has extra children')"/>
                                <xsl:break/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="d:compare(., $other)"/>
                                <xsl:next-iteration/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:iterate>
                    <xsl:if test="count($b/child::node()) gt count(child::node())">
                        <xsl:variable name="pos" select="count(child::node()) + 1"/>
                        <xsl:sequence select="d:show-difference((), $b/child::node()[$pos], 'Second tree has extra children')"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>

    
    <xsl:function name="d:nodekind" as="xs:string">
        <xsl:param name="node" as="node()"/>
        <xsl:choose>
            <xsl:when test="$node instance of element()">E</xsl:when>
            <xsl:when test="$node instance of attribute()">A</xsl:when>
            <xsl:when test="$node instance of text()">T</xsl:when>
            <xsl:when test="$node instance of document-node()">D</xsl:when>
            <xsl:when test="$node instance of comment()">C</xsl:when>
            <xsl:when test="$node instance of processing-instruction()">P</xsl:when>
            <xsl:otherwise>N</xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="d:sorted-attributes" as="attribute()*">
        <xsl:param name="e" as="node()"/>
        <xsl:perform-sort select="$e/@*">
            <xsl:sort select="namespace-uri(.)"/>
            <xsl:sort select="local-name(.)"/>
        </xsl:perform-sort>
    </xsl:function>

    <xsl:function name="d:shorten-string" as="xs:string">
        <xsl:param name="s" as="xs:string"/>
        <xsl:sequence select="if (string-length($s) lt 10) then $s else (substring($s, 1, 10)||'...') "/>
    </xsl:function>
    
    <xsl:function name="d:show-difference" as="node()">
        <xsl:param name="a" as="node()?"/>
        <xsl:param name="b" as="node()?"/>
        <xsl:param name="message" as="xs:string"/>
        <d:DIFFERENCE message="{$message}" at="{if ($a) then path($a) else path($b)}">
            <d:_1>
                <xsl:copy select="$a">
                    <xsl:copy-of select="$a/@*"/>
                </xsl:copy>
            </d:_1>
            <d:_2>
                <xsl:copy select="$b">
                    <xsl:copy-of select="$b/@*"/>
                </xsl:copy>
            </d:_2>
        </d:DIFFERENCE>
    </xsl:function>
    
    <xsl:template name="xsl:initial-template">
        <xsl:variable name="x">
            <a>
                <b/>
                <c/>
                <d>something</d>
                <d>something else</d>
            </a>
        </xsl:variable>
        <xsl:variable name="y">
            <a>
                <b/>
                <c/>
                <d>something</d>
                <d>something else</d>
                <e/>
            </a>
        </xsl:variable>
        <xsl:sequence select="d:compare($x, $y)"/>
    </xsl:template>
    
    
</xsl:stylesheet>