<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- BUG: 5.4.1/008 -->
<!-- DESCRIPTION: No error is reported if xsl:text or xsl:value-of is used at the top level of the
    stylesheet. -->
    <?spec xslt#errors?><?error XTSE0010?>

<xsl:text>This is not allowed!</xsl:text>
 
</xsl:stylesheet>

