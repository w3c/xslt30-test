<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="map xs err">

  <xsl:variable name="RUN" select="true()" static="yes"/>
  <xsl:strip-space elements="*"/>

 
  <!-- Test of xsl:conditional-content with xsl:element (not empty) -->

  <xsl:template name="s-001" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <xsl:element name="a">
            <xsl:sequence select="./BOOKLIST/BOOKS/ITEM/PRICEDATA"/>
          </xsl:element>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Test of xsl:conditional-content with multiple elements, some empty -->
  
  <xsl:template name="s-002" use-when="$RUN">
       <xsl:stream href="../docs/books.xml">
           <Results>
               <xsl:conditional-content>
                 <first>one</first>
                 <second/>
                 <xsl:copy-of select="BOOKLIST/CATEGORIES/*" />
                 <last>last</last>
               </xsl:conditional-content>
           </Results>
       </xsl:stream>
   </xsl:template> 
   
   <!-- Test of xsl:conditional-content with atomic values, some empty -->
  
  <xsl:template name="s-003" use-when="$RUN">
       <xsl:stream href="../docs/books.xml">
           <out>
               <xsl:conditional-content>
                 <xsl:sequence select="23, '', xs:date('2011-01-01'), xs:untypedAtomic(''), 0, /JUNK, xs:base64Binary('')"/>
               </xsl:conditional-content>
           </out>
       </xsl:stream>
   </xsl:template>
   
   <!-- Test of xsl:conditional-content with xsl:if -->

  <xsl:template name="s-004" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <a>
            <xsl:if test="current-date() lt xs:date('1900-01-01')">
               <banana x="{count(//*)}"/>
            </xsl:if>
          </a>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with xsl:if -->

  <xsl:template name="s-005" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <a>
            <xsl:if test="current-date() gt xs:date('1900-01-01')">
               <banana x="{count(//*)}"/>
            </xsl:if>
          </a>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with xsl:for-each -->

  <xsl:template name="s-006" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <ul>
            <xsl:for-each select="outermost(//ITEM)">
              <li><xsl:value-of select="TITLE"/></li>
            </xsl:for-each>  
          </ul>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with xsl:for-each -->

  <xsl:template name="s-007" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <ul>
            <xsl:for-each select="outermost(//MAGAZINE)">
              <li><xsl:value-of select="TITLE"/></li>
            </xsl:for-each>  
          </ul>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with comment nodes -->

  <xsl:template name="s-008" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:for-each select="outermost(//ITEM)">
          <in>
            <xsl:conditional-content>
              <xsl:comment select="TITLE[parent::BOOK]"/>
            </xsl:conditional-content>
            <xsl:conditional-content>
              <xsl:comment select="count(ancestor::node())"/>
            </xsl:conditional-content> 
          </in>  
         </xsl:for-each>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with text nodes -->

  <xsl:template name="s-009" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:for-each select="outermost(//ITEM)">
          <in>
            <xsl:conditional-content>
              <xsl:value-of select="TITLE[parent::BOOK]"/>
            </xsl:conditional-content>
            <xsl:conditional-content>
              <xsl:value-of select="count(ancestor::node())"/>
            </xsl:conditional-content> 
          </in>  
         </xsl:for-each>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with xsl:fork -->

  <xsl:template name="s-010" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <a>
            <xsl:fork>
              <xsl:sequence select="copy-of(//TITLE)"/>
              <xsl:sequence select="copy-of(//PRICE)"/>  
            </xsl:fork>
          </a>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template> 
  
  <!-- Test of xsl:conditional-content with xsl:fork -->

  <xsl:template name="s-011" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:conditional-content>
          <a>
            <xsl:fork>
              <xsl:sequence select="copy-of(//TITTLE)"/>
              <xsl:sequence select="copy-of(//PRICLE)"/>  
            </xsl:fork>
          </a>
        </xsl:conditional-content>  
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Test of xsl:conditional-content with document nodes -->
  
  <xsl:template name="s-012" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:variable name="t" as="document-node()?">          
          <xsl:conditional-content>
            <xsl:document>
              <xsl:copy-of select="//TITLE[@flamingo]"/>
            </xsl:document>
          </xsl:conditional-content>
        </xsl:variable>
        <in value="{empty($t)}"/>     
      </out>
    </xsl:stream>
  </xsl:template> 
 




</xsl:stylesheet>
