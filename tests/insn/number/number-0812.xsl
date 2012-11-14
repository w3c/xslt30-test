<?xml version="1.0"?> 
<?spec xslt#number?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="iso-8859-1"/>

  <!-- PURPOSE: test numbering in German words -->
  <xsl:template match="doc">
    <out>
        3 = <xsl:number value="3" format="w" lang="de"/>;
        10 = <xsl:number value="10" format="w" lang="de"/>;
        13 = <xsl:number value="13" format="w" lang="de"/>;
        20 = <xsl:number value="20" format="w"  lang="de"/>;
        100 = <xsl:number value="100" format="W" lang="de"/>;
        115 = <xsl:number value="115" format="W" lang="de"/>;
        134 = <xsl:number value="134" format="W" lang="de"/>;
        200 = <xsl:number value="200" format="w" lang="de"/>;
        201 = <xsl:number value="201" format="w" lang="de"/>;
        210 = <xsl:number value="210" format="w" lang="de"/>;
        230 = <xsl:number value="230" format="w"  lang="de"/>;
        1000 = <xsl:number value="1000" format="W" lang="de"/>;
        1005 = <xsl:number value="1005" format="W" lang="de"/>;
        2134816 = <xsl:number value="2134816" format="Ww" lang="de"/>;       
    </out>
  </xsl:template>
 
</xsl:stylesheet>
