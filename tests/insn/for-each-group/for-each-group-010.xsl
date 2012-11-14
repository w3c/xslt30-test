<?spec xslt#grouping?>
<table xsl:version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- grouping used to arrange data in columns in a table -->
  <xsl:variable name="columns" select="2"/>
  <xsl:variable name="items" select="count(cities/city)"/>
  <xsl:variable name="sorted-cities">
     <xsl:for-each select="cities/city">
     <xsl:sort select="@name"/>
        <xsl:copy-of select="."/>
     </xsl:for-each>
  </xsl:variable>
  <xsl:for-each-group select="$sorted-cities/city" group-by="ceiling(position() div $columns)"
                      bind-group="g">
    <tr>
      <xsl:for-each select="$g">
        <td><xsl:value-of select="@name"/></td>
      </xsl:for-each>
      <xsl:if test="count($g) &lt; $columns">
        <xsl:for-each select="count($g)+1 to $columns">
          <td>&#xa0;</td>
        </xsl:for-each>
      </xsl:if>
    </tr>
  </xsl:for-each-group>
</table>    