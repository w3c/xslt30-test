<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   xmlns="http://java.sun.com/xml/ns/javaee"
   xpath-default-namespace="http://java.sun.com/xml/ns/javaee">
   <xsl:output method="xml" indent="no" encoding="UTF-8"/>
   
   <xsl:param name="servletName"/>
   <xsl:param name="urlPattern" select='concat("/servlet/",$servletName,"/*")'/>  <!-- Default to normal servlet URL pattern -->
   
   <xsl:template match="servlet-mapping[servlet-name=$servletName] / url-pattern[position()=last()]">
   </xsl:template>
   

</xsl:stylesheet>