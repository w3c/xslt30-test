<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="ISO-8859-1" media-type="text/html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="document/departaments">
    <xhtml>
      <head>
        <title>test fn:id()</title>
      </head>
      <body>
        <xsl:for-each select="departament">
          <h1>
            <xsl:value-of select="@nam"/>
          </h1>
          <h2>Staff of <xsl:value-of select="@nam"/> departament</h2>
          <ul>
            <xsl:for-each select="id(@people)">
              <li>
                <xsl:value-of select="@name"/>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>
      </body>
    </xhtml>
  </xsl:template>
</xsl:stylesheet>
