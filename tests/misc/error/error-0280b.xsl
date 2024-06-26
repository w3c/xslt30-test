<?xml version="1.0" encoding="UTF-8"?>
<!--In the case of a prefixed lexical QName used as the
                        value (or as part of the value) 
                        of an attribute in the stylesheet,
                        or appearing within an XPath expression
                        in the stylesheet, it is a static
                           error if the defining
                              element has no namespace node whose name matches the prefix of the
                        lexical QName.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Error: xsl:call-template using an undeclared namespace  -->
<?spec xslt#errors?><?error XTSE0280?>

  <xsl:template match="doc" name="this">
      <out>
         <xsl:call-template name="a:template"/>
         <xsl:message>Error not detected!</xsl:message>
      </out>
  </xsl:template>
  
   <xsl:template xmlns:a="http://a.uri/" name="a:template"/>  


</xsl:stylesheet>
