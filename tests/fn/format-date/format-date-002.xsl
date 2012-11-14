<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

<?spec xslt#format-date?>
  <!-- PURPOSE: XSLT 2.0: test format-time: basic numeric formats -->

  <xsl:param name="t" as="xs:time" select="xs:time('09:15:06.456')"/>  

  <xsl:template name="main">
<out>;
<tr><code>09:15</code><code x='{format-time($t,"[H01]:[m01]")}'/></tr>;
<tr><code>9:15</code><code x='{format-time($t,"[H]:[m]")}'/></tr>;
<tr><code>09:15:06</code><code x='{format-time($t,"[H01]:[m01]:[s01]")}'/></tr>;
<tr><code>9:15:06</code><code x='{format-time($t,"[H]:[m]:[s]")}'/></tr>;
<tr><code>9:15:6</code><code x='{format-time($t,"[H]:[m]:[s1]")}'/></tr>;
<tr><code>9:15:06.5</code><code x='{format-time($t,"[H]:[m]:[s]:[f,1-1]")}'/></tr>;
<tr><code>9:15:06.5</code><code x='{format-time($t,"[H]:[m]:[s]:[f1,1-1]")}'/></tr>;
<tr><code>9:15:06.46</code><code x='{format-time($t,"[H]:[m]:[s]:[f01]")}'/></tr>;
<tr><code>9:15:06.456</code><code x='{format-time($t,"[H]:[m]:[s]:[f001]")}'/></tr>;
</out>     
  </xsl:template>

</xsl:stylesheet>