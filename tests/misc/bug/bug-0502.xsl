<?xml version="1.0" ?>

<?spec xpath#axes?>
<!-- BUG: Saxon 5.3/009  -->
<!-- DESCRIPTION: The parent of a namespace node is the element on which the namespace was
    declared, not the element on whose namespace axis the namespace node lies. -->

<out xsl:version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:saxon="http://icl.com/saxon"
   xsl:exclude-result-prefixes="saxon"
>

<xsl:for-each select="//*">
  <element><xsl:value-of select="name()"/>:
      <xsl:for-each select="namespace::*"><xsl:sort select="name()"/>
           <xsl:value-of select="name()"/> = <xsl:value-of select="."/>
               (owner: <xsl:value-of select="name(..)"/>)
      </xsl:for-each>
  </element>    
</xsl:for-each>

</out>
