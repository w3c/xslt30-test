<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://local.functions/"
    exclude-result-prefixes="map xs f">
    
    <!-- Test of xsl:stream calling index-of(), first argument consuming and climbing  -->
    
    <xsl:template name="i-001">
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="index-of(/account/transaction/@date, '2007-01-21')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Test of xsl:stream calling index-of(), first argument motionless, second argument streamed  -->
    
    <xsl:template name="i-002">
      <xsl:variable name="accounts" as="element()*">
      	<account-number>01234567a</account-number>
      	<account-number>01234567b</account-number>
      	<account-number>01234567c</account-number>
      	<account-number>01234567d</account-number>
      	<account-number>01234567</account-number>
      	<account-number>01234567e</account-number>
      	<account-number>01234567f</account-number>
      </xsl:variable>	
      
      <xsl:stream href="../docs/big-transactions.xml">
        <out>
          <xsl:value-of select="index-of($accounts, /account/account-number)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    
    
</xsl:stylesheet>