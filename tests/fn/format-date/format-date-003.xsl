<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

<?spec xslt#format-date?>
  <!-- PURPOSE: XSLT 2.0: test format-dateime: basic numeric formats -->

  <xsl:param name="t" as="xs:dateTime" select="xs:dateTime('2003-09-07T09:15:06.456')"/>  

  <xsl:template name="main">
<out>;
 <tr><code>2003-09-7</code><code x='{format-dateTime($t,"[Y]-[M01]-[D]")}'/></tr>;
 <tr><code>9-7-2003</code><code x='{format-dateTime($t,"[M]-[D]-[Y]")}'/></tr>;
 <tr><code>7-9-2003</code><code x='{format-dateTime($t,"[D]-[M]-[Y]")}'/></tr>;
 <tr><code>7 IX 2003</code><code x='{format-dateTime($t,"[D1] [MI] [Y]")}'/></tr>;
 <tr><code>[2003-09-07]</code><code x='{format-dateTime($t,"[[[Y]-[M01]-[D01]]]")}'/></tr>;
 <tr><code>[2003-09-07]</code><code x='{format-dateTime($t,"[[[Y0001]-[M01]-[D01]]]")}'/></tr>; 
 <tr><code>(03-09-07)</code><code x='{format-dateTime($t,"([Y01]-[M01]-[D01])")}'/></tr>; 
 <tr><code>09:15</code><code x='{format-dateTime($t,"[H01]:[m01]")}'/></tr>;
 <tr><code>9:15</code><code x='{format-dateTime($t,"[H]:[m]")}'/></tr>;
 <tr><code>09:15:06</code><code x='{format-dateTime($t,"[H01]:[m01]:[s01]")}'/></tr>;
 <tr><code>9:15:06</code><code x='{format-dateTime($t,"[H]:[m]:[s]")}'/></tr>;
 <tr><code>9:15:6</code><code x='{format-dateTime($t,"[H]:[m]:[s1]")}'/></tr>;
 <tr><code>9:15:06.5</code><code x='{format-dateTime($t,"[H]:[m]:[s]:[f,1-1]")}'/></tr>;
 <tr><code>9:15:06.5</code><code x='{format-dateTime($t,"[H]:[m]:[s]:[f1,1-1]")}'/></tr>;
 <tr><code>9:15:06.46</code><code x='{format-dateTime($t,"[H]:[m]:[s]:[f01]")}'/></tr>;
 <tr><code>9:15:06.456</code><code x='{format-dateTime($t,"[H]:[m]:[s]:[f001]")}'/></tr>;
 <tr><code>2003-09-07T09:15:06.456</code><code x="{format-dateTime($t,'[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]:[f001]')}"/></tr>;
</out>     
  </xsl:template>

</xsl:stylesheet>