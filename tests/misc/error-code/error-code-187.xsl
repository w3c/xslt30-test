<!-- this succeeds in 1.0, with top-down construction, but is should fail in 2.0 with bottom up construction.
      Note that the xsl:copy is copying a document node which can't have an attribute. -->
      <?spec xslt#errors?><?error XTDE0420?>
<a xsl:version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:copy>
  <xsl:attribute name="x">5</xsl:attribute>
 </xsl:copy>
</a>