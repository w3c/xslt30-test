<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- PURPOSE: effect of BC on default output method -->
  <!-- if XHTML is chosen, meta elements are added and URIs are escaped -->

  <xsl:template name="main">
    <xsl:result-document>
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>In 1.0 mode this should be XML (not XHTML)</title>
      </head>
      <body>
        <p>This link should therefore not be escaped: <a href="file:///My D&#xf8;cuments/page.html">click here</a></p>
      </body>
    </html>
    </xsl:result-document>  
  </xsl:template>


</xsl:stylesheet>
