<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:r="http://www.w3.org/2012/11/xslt30-test-results"
    xmlns:cat="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!-- Convert Exselt test submission into standard format -->
    
    <xsl:variable name="catalog" select="doc('../../catalog.xml')"/>
    <xsl:variable name="submission" select="doc('exselt-test-report-basic.xml')"/>
    
    <xsl:template name="xsl:initial-template">
        <r:test-suite-result>
            <r:implementation name="Exselt" version="0.0" anonymous-result-column="false">
                <r:organization name="http://www.exselt.com/" anonymous="false"/>
                <r:submitter name="Abel Braaksma" email="abel"/>
            </r:implementation>
            <r:test-run dateRun="2017-02-14" testsuiteVersion="3.0.1"/>
            <xsl:for-each select="$catalog//cat:test-set/@file ! document(.)">
                <r:test-set name="{*/@name}">
                    <xsl:for-each select=".//cat:test-case">
                        <xsl:variable name="sub" select="$submission//test-case[.=current()/@name]"/>
                        <xsl:variable name="result">
                            <xsl:choose>
                                <xsl:when test="$sub/@result = 'success'">pass</xsl:when>
                                <xsl:when test="$sub/@result = 'failed'">fail</xsl:when>
                                <xsl:when test="$sub/@result = 'ignored'">notRun</xsl:when>
                                <xsl:otherwise>notRun</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                       <r:test-case name="{@name}" result="{$result}">
                           <xsl:if test="$sub/@reason">
                               <xsl:attribute name="comment" select="$sub/@reason"/>
                           </xsl:if>                          
                       </r:test-case> 
                    </xsl:for-each>
                </r:test-set>
            </xsl:for-each>    
        </r:test-suite-result>   
    </xsl:template>
</xsl:stylesheet>