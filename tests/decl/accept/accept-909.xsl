<xsl:package
  name="http://www.w3.org/xslt30tests/accept-909"  
  package-version="1.0.0"
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- tests error XTDE3052 to be raised on abstract component -->

    <xsl:use-package name="http://www.w3.org/xslt30tests/package-909" package-version="1.0.0">
        <xsl:accept names="xsl:initial-template" visibility="public" component="template" />
        <!-- if a wildcard matches, and the visibility combination is allowed, it applies to the matching component -->
        <xsl:accept names="*" visibility="hidden" component="*" />
    </xsl:use-package>  

</xsl:package>    