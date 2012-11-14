<?xml version="1.0"?> 
<?spec xslt#number?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="iso-8859-1"/>

  <!-- PURPOSE: test ordinal numbering in German words -->
  <xsl:template match="doc">
    <out>
        3 = <xsl:number value="3" format="w" lang="de" ordinal="-e"/>;
        10 = <xsl:number value="10" format="w" lang="de" ordinal="-er"/>;
        13 = <xsl:number value="13" format="w" lang="de" ordinal="-es"/>;
        20 = <xsl:number value="20" format="w"  lang="de" ordinal="-en"/>;
        100 = <xsl:number value="100" format="W" lang="de" ordinal="-e"/>;
        115 = <xsl:number value="115" format="W" lang="de" ordinal="-er"/>;
        134 = <xsl:number value="134" format="W" lang="de" ordinal="-es"/>;
        200 = <xsl:number value="200" format="w" lang="de" ordinal="-en"/>;
        201 = <xsl:number value="201" format="w" lang="de" ordinal="-e"/>;
        210 = <xsl:number value="210" format="w" lang="de" ordinal="-er"/>;
        230 = <xsl:number value="230" format="w"  lang="de" ordinal="-es"/>;
        1000 = <xsl:number value="1000" format="W" lang="de" ordinal="-en"/>;
        1005 = <xsl:number value="1005" format="W" lang="de" ordinal="-e"/>;
        2134816 = <xsl:number value="2134816" format="Ww" lang="de" ordinal="-er"/>;       
    </out>
  </xsl:template>
 
</xsl:stylesheet>
