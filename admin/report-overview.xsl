<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xt="http://xt3report.com/functions"
    xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    xpath-default-namespace="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="math xs xsi cat xt"
    expand-text="yes"
    version="3.0">
    
    <xsl:output indent="yes" method="html" html-version="5.0"/>

    <xsl:strip-space elements="*"/>
    
    <xsl:attribute-set name="cell">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="first-cell">
    </xsl:attribute-set>
    
    <xsl:attribute-set name="last-cell">
    </xsl:attribute-set>

    <xsl:attribute-set name="header-cell">
        <xsl:attribute name="class">header</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="xslt2">
        <xsl:attribute name="title">Tests that can be run on an XSLT 2.0 processor, but not on an XSLT 1.0 processor</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="xslt3">
        <xsl:attribute name="title">Tests that can be run on an XSLT 3.0 processor, but not on an XSLT 2.0 or lower processor</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="xsltany">
        <xsl:attribute name="title">Tests that can be run on an any XSLT processor</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="total">
        <xsl:attribute name="title">Total tests in this category</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="pass">
        <xsl:attribute name="title">Tests passed by zero/one/more processors</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="last-header-cell" use-attribute-sets="header-cell">
    </xsl:attribute-set>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>XSLT 3.0 test case overview</title>
                <style type="text/css" xsl:expand-text="no">
                    * {
                        font-family: Arial, sans-serif;
                    }
                    
                    table {
                        border: 1pt gray solid;
                        width: 900px;
                    }
                    
                    table * {
                        font-size: 10pt;
                    }
                    
                    th {
                        border: 0pt gray solid;
                        border-left: 1pt gray dotted;
                        padding: 3pt .8em 2pt .8em;
                        text-align: left;
                    }
                    
                    table th.header {
                        font-size: 12pt;
                        text-align: right;
                        cursor: help;
                        text-decoration: underline;
                        text-decoration-style: dotted;
                        text-decoration-color: gray;
                        white-space: nowrap;
                    }
                    
                    tr > th:first-child {
                        padding-left: 4pt;
                    }
                    
                    td {
                        border: 0pt gray solid;
                        border-left: 1pt gray dotted;
                        padding: 2pt .8em 2pt .8em;
                        text-align: right;
                    }

                    caption {
                        font-weight: bold;
                        font-size: 14pt;
                        padding: 3em 0 .6em 0;
                    }
                </style>
            </head>
            <body>
                <h1>XSLT 3.0 test case overview</h1>
                <table style="border-style:collapse;border:1pt grey solid;border-spacing: 0;">
                    <caption>Overview by XT3 category</caption>
                    <xsl:apply-templates select="report/overview"/>
                </table>
                <xsl:apply-templates select="report/changes-since-xslt2"/>
                <xsl:apply-templates select="report/category" />
                <xsl:apply-templates select="report/category/test-set/keywords" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="report/overview">
        <tr>
            <th xsl:use-attribute-sets="header-cell">&#xA;</th>
            <th xsl:use-attribute-sets="header-cell xslt2">XSLT 2.0</th>
            <th xsl:use-attribute-sets="header-cell xslt3">XSLT 3.0</th>
            <th xsl:use-attribute-sets="header-cell xsltany">Other</th>
            <th xsl:use-attribute-sets="header-cell total">Total</th>
            <th xsl:use-attribute-sets="header-cell pass">Pass rate</th>
        </tr>
        <tr>
            <th xsl:use-attribute-sets="first-cell">All categories<br />&#xA0;</th>
            <td xsl:use-attribute-sets="cell">{xslt2-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt3-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt-other/@count}</td>
            <td xsl:use-attribute-sets="cell">{@total-tests-in-xt3}</td>
            <td xsl:use-attribute-sets="last-cell"><span style="color:red">{@total-tests-in-xt3 - pass1/@count - pass2/@count}</span>/{pass1/@count}/{pass2/@count}</td>
        </tr>
        <xsl:apply-templates select="../category/overview" />
    </xsl:template>
    
    <xsl:template match="category/overview">
        <!-- totals in the very first "overview by category" -->
        <tr>
            <th xsl:use-attribute-sets="first-cell">
                <a href="#{encode-for-uri(parent::category/@name)}-xt3">{parent::category/@name}</a>
            </th>
            <td xsl:use-attribute-sets="cell">{xslt2-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt3-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt-other/@count}</td>
            <td xsl:use-attribute-sets="cell">{@total-tests-in-category}</td>
            <td xsl:use-attribute-sets="last-cell"><span style="color:red">{@total-tests-in-category - pass1/@count - pass2/@count}</span>/{pass1/@count}/{pass2/@count}</td>
        </tr>
    </xsl:template>
    
    <xsl:template match="report/category">
        <!-- caption-then-report per category, as clicked-through from the opening table -->
        <table>
            <caption><a id="{encode-for-uri(@name)}-xt3" />{@name} (XT3)</caption>
            
            <tr>
              <th xsl:use-attribute-sets="header-cell">&#xA0;</th>
              <th xsl:use-attribute-sets="header-cell xslt2">XSLT 2.0</th>
              <th xsl:use-attribute-sets="header-cell xslt3">XSLT 3.0</th>
              <th xsl:use-attribute-sets="header-cell xsltany">Other</th>
              <th xsl:use-attribute-sets="header-cell total">Total</th>
              <th xsl:use-attribute-sets="last-header-cell pass">Pass rate</th>
            </tr>
            
            <!-- first row per category -->
            <xsl:apply-templates select="overview" mode="cat-overview" />
            
            <!-- other rows, to be clicked-through further down -->
            <xsl:apply-templates select="test-set" />
        </table>
    </xsl:template>

    <xsl:template match="category/overview" mode="cat-overview">
        <!-- totals per category, as clicked-through from the opening table, this is the first row -->
        <tr>
            <th xsl:use-attribute-sets="first-cell">{parent::category/@name} (all)</th>
            <td xsl:use-attribute-sets="cell">{xslt2-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt3-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt-other/@count}</td>
            <td xsl:use-attribute-sets="cell">{@total-tests-in-category}</td>
            <td xsl:use-attribute-sets="last-cell"><span style="color:red">{@total-tests-in-category - pass1/@count - pass2/@count}</span>/{pass1/@count}/{pass2/@count}</td>
        </tr>
    </xsl:template>

    <xsl:template match="category/test-set">
        <tr>
            <th xsl:use-attribute-sets="first-cell">
                <a href="#{encode-for-uri(@description)}-keywords">{@description}</a>
            </th>
            <td xsl:use-attribute-sets="cell">{xslt2-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt3-specific/@count}</td>
            <td xsl:use-attribute-sets="cell">{xslt-other/@count}</td>
            <td xsl:use-attribute-sets="cell">{@total-tests}</td>
            <td xsl:use-attribute-sets="last-cell"><span style="color:red">{@total-tests - pass1/@count - pass2/@count}</span>/{pass1/@count}/{pass2/@count}</td>
        </tr>
    </xsl:template>
    

    <xsl:template match="changes-since-xslt2">
        <table style="border-style:collapse;border:1pt grey solid;border-spacing: 0;">
            <caption>Overview by 3.0 feature</caption>
    
            <tr>
                <th xsl:use-attribute-sets="header-cell">&#xA;</th>
                <th xsl:use-attribute-sets="header-cell">Total</th>
                <th xsl:use-attribute-sets="header-cell pass">Pass rate</th>
            </tr>
            <tr>
                <th xsl:use-attribute-sets="first-cell">All features</th>
                <td xsl:use-attribute-sets="cell">{sum(feature/@count[not(contains(., 'unknown'))])}</td>
                <td xsl:use-attribute-sets="cell">{sum(feature[@count != 'unknown']/@pass1)}/{sum(feature[@count != 'unknown']/@pass2)}</td>
            </tr>
            <xsl:for-each-group select="feature" group-adjacent="@group">
                <tr>
                    <th xsl:use-attribute-sets="first-cell">
                        <a href="#{encode-for-uri(current-grouping-key())}">{current-grouping-key()}</a>
                    </th>
                    <td xsl:use-attribute-sets="cell">{sum(current-group()/self::feature/@count[not(contains(., 'unknown'))])}</td>
                </tr>    
            </xsl:for-each-group>
        </table>
        
        <xsl:for-each-group select="feature" group-adjacent="@group">
            <table>
                <caption><a id="{encode-for-uri(current-grouping-key())}" />Feature: {current-grouping-key()}</caption>
                <xsl:apply-templates select="current-group()" />
            </table>    
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="feature">
        <tr>
            <th xsl:use-attribute-sets="first-cell">{@name}</th>
            <td xsl:use-attribute-sets="cell">{@count}</td>
        </tr>
    </xsl:template>
    
    <xsl:template match="keywords">
        <table style="width:300px">
            <caption><a id="{encode-for-uri(../@description)}-keywords" />{../@name} (keywords)
                <div style="padding-top:.5em;font-size:8pt;font-weight:normal">(description: {../@description})</div>
            </caption>
            <xsl:if test="key">
                <tr>
                    <th>Key</th>
                    <th>Count</th>
                </tr>
                <xsl:apply-templates select="key" />
            </xsl:if>
            <xsl:if test="not(key)">
                <tr>
                    <td colspan="2">No keywords specified for this category yet</td>
                </tr>
            </xsl:if>
        </table>
        
    </xsl:template>
    
    <xsl:template match="key">
        <tr>
            <th xsl:use-attribute-sets="first-cell">{@name}</th>
            <td xsl:use-attribute-sets="cell">{@count}</td>
        </tr>
    </xsl:template>
    
    
</xsl:stylesheet>