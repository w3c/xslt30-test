<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:my="http://my.uri/" exclude-result-prefixes="my xs">

<?spec xslt#key?>

  <!-- Test for key() used to create hyperlinks in HTML output.
       Modified to remove dependency on generate-id -->

  <xsl:output indent="yes"/>

  <xsl:key name="titles" match="div" use="title"/>
  <xsl:key name="id" match="@id" use="."/>

  <xsl:template match="doc">
     <out>
      <H1>Test for xsl:key, and key().</H1>
      <P>Reference numbers should match the titles, links should work.</P>
      <xsl:for-each select="div">
        <HR/>
        <H1 id="{my:local-id(.)}">
        <xsl:number level="multiple" count="div" format="1.1. "/>
        <xsl:value-of select="title"/></H1>
        <xsl:apply-templates/>
      </xsl:for-each>
     </out>  
  </xsl:template>
  
  <xsl:template match="p">
    <P><xsl:apply-templates/></P>
  </xsl:template>

  <xsl:template match="divref">
    <A href="#{my:local-id(key('titles', .))}">
      <xsl:for-each select="key('titles', .)">
         <xsl:number level="multiple" count="div" format="1.1. "/>
      </xsl:for-each>
      <xsl:value-of select="."/>
    </A>
  </xsl:template> 

  <xsl:template match="keydivref">
    <A href="#{my:local-id(key('id', .)/..)}">
      <xsl:for-each select="key('id', .)">
         KEY <xsl:number level="multiple" count="div" format="1.1. "/>
      </xsl:for-each>
      <xsl:value-of select="."/>
    </A>
  </xsl:template>
  
  <xsl:function name="my:local-id" as="xs:string">
    <xsl:param name="node" as="node()"/>
    <xsl:number select="$node" level="any" format="i"/>
  </xsl:function>

</xsl:stylesheet>
