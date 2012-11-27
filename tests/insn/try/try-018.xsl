<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
  xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="err">

  <!-- xsl:catch with variables to receive error information -->

  <xsl:template name="main">
    <out>
      <xsl:try>
        <xsl:sequence select="doc('rubbish.xml')"/>
        <xsl:catch errors="*">
          <e>
            <xsl:value-of select="$err:code, $err:description, $err:value" separator="|"/>
          </e>
          <e>
            <xsl:value-of
              select="tokenize($err:module, '/')[last()], $err:line-number, $err:column-number"
              separator="|"/>
          </e>
        </xsl:catch>
      </xsl:try>
    </out>
  </xsl:template>

</xsl:stylesheet>
