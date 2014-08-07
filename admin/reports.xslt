<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    version="3.0">
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <report 
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <xsl:apply-templates select="doc('../catalog.xml')" mode="catalog"/>
        </report>
    </xsl:template>
    
    <xsl:template match="/" mode="catalog">
        <xsl:variable name="all">
            <xsl:apply-templates select="catalog/test-set" mode="#current" />
        </xsl:variable>
        <xsl:apply-templates select="$all/test-set
            [test-case-information[xslt3[@count-specific + @count-forward > 0]]]" mode="report"/>
    </xsl:template>
    
    <xsl:template match="test-set" mode="report">
         <xsl:copy-of select="." />
    </xsl:template>
    
    
    
    <xsl:template match="test-set" mode="catalog">
        <xsl:apply-templates select="doc(concat('../', @file))" mode="test-set" />
    </xsl:template>
    
    <xsl:template match="/" mode="test-set">
        <test-set name="{test-set/@name}" uri="{base-uri()}" description="{test-set/description}">
            <test-case-information count="{count(test-set/test-case)}" >
                <xslt1 count-total="{count(test-set/test-case/dependencies[spec[@value='XSLT10' or @value='XSLT10+']])}"
                    count-specific="{count(test-set/test-case/dependencies[spec[@value='XSLT10']])}"
                    count-backward="0"
                    count-forward="{count(test-set/test-case/dependencies[spec[@value='XSLT10+']])}">
                    
                </xslt1>
                <xslt2 count-total="{count(test-set/test-case/dependencies[spec[@value='XSLT20' or @value='XSLT20+' or @value='XSLT10+']])}"
                    count-specific="{count(test-set/test-case/dependencies[spec[@value='XSLT20']])}"
                    count-backward="{count(test-set/test-case/dependencies[spec[@value='XSLT10+']])}"
                    count-forward="{count(test-set/test-case/dependencies[spec[@value='XSLT20+']])}">
                    
                </xslt2>
                <xslt3 count-total="{count(test-set/test-case/dependencies[spec[@value='XSLT30' or @value='XSLT30+' or @value='XSLT20+' or @value='XSLT10+']])}" 
                    count-specific="{count(test-set/test-case/dependencies[spec[@value='XSLT30']])}" 
                    count-backward="{count(test-set/test-case/dependencies[spec[@value='XSLT20+' or @value='XSLT10+']])}" 
                    count-forward="{count(test-set/test-case/dependencies[spec[@value='XSLT30+']])}">
                    <coverage>
                        <xsl:variable name="xsl-elements">
                            <xsl:apply-templates select="test-set/test-case[1]/test/stylesheet/@file" mode="#current" />
                        </xsl:variable>
                        <xsl:for-each select="distinct-values($xsl-elements/xsl-elements/@found/tokenize(., ' '))">
                            <element name="xsl:{.}" count="{count($xsl-elements/xsl-elements[contains(@found, current())])}" />
                        </xsl:for-each>                        
                    </coverage>
                </xslt3>
                <other count-nospec="{count(test-set/test-case/dependencies[not(spec)])}" 
                    count-wrongvalue="{count(test-set/test-case/dependencies[spec[not(starts-with(@value,'XSLT3') or starts-with(@value,'XSLT2') or starts-with(@value,'XSLT1'))]])}" />
                    
            </test-case-information>
        </test-set>
    </xsl:template>
    
    <xsl:template match="@file" mode="test-set">
        <xsl:variable name="base-path" select="replace(base-uri(.), '[^/]+$', '')" />
       <xsl:try>
           <xsl:apply-templates select="doc(concat($base-path, .))" mode="test-xslfile" />
           <xsl:catch>
               <xsl-elements error-in-file="{concat($base-path, .)}" error="" />
           </xsl:catch>
       </xsl:try>
    </xsl:template>
    
    <xsl:template match="/" mode="test-xslfile">
        <xsl-elements found="{distinct-values(//xsl:*/local-name())}" />
    </xsl:template>
</xsl:stylesheet>