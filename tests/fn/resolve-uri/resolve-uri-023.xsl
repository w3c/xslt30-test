<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0" expand-text="yes">

    <!-- 
        Rudimentary but excessive test for deeper dotted relative paths with resolve-uri and base uris
        Test covers:
        - dot elements in relative base uri
        - dot elements in rel uri
        - dot elements that try to get past the auth segment (should return scheme '://' auth '/')
        - absolute path in base uri that, because it must be resolved, acc to RFC 3986, should remove dot segments, quote:
        - none of these tests have $relative ending with a non-dotted segment, which means that all resolution will end with trailing "/"
        
        "However, some deployed implementations incorrectly assume that reference resolution
        is not necessary when the reference is already a URI and thus fail to remove 
        dot-segments when they occur in non-relative paths.  URI normalizers should remove 
        dot-segments by applying the remove_dot_segments algorithm to the path, as described 
        in Section 5.2.4."
    -->
    
    <!-- Copy of resolve-uri-022 changed to require run-time resolution -->
    

    <xsl:output indent="no"></xsl:output>
    
    <xsl:param name="p" select="''"/>

    <xsl:template match="/" name="initial-template">
        
        <out xml:base="http://example.com/a/b/c/d/../d/e/f/g/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z">
            <xsl:variable name="base" select="static-base-uri()" xml:base="Z/../Z"/>
            
            <!-- varying bases -->
            <base>{$base}</base>
            <base>{static-base-uri()}</base>
            <base>{resolve-uri(static-base-uri(), static-base-uri())}</base>
            
            <!-- ignorable dots, *but* removes the "z", leaves the trailing "/" -->
            <resolve>{resolve-uri($p||'.')}</resolve>
            <resolve>{resolve-uri($p||'./')}</resolve>
            <resolve>{resolve-uri($p||'./././././././')}</resolve>
            
            <!-- variants of trying to get past the root, should return root path acc. to RFC, and *must* include root path leading "/" -->
            <resolve>{resolve-uri($p||'/')}</resolve>
            <resolve>{resolve-uri($p||'/./././././././')}</resolve>
            <resolve>{resolve-uri($p||'/../../.././././././././')}</resolve>
            <resolve>{resolve-uri($p||'/..')}</resolve>
            <resolve>{resolve-uri($p||'/../')}</resolve>
            <resolve>{resolve-uri($p||'../', 'http://example.com')}</resolve>
            <resolve>{resolve-uri($p||'../Z/..', 'http://example.com')}</resolve>
            <resolve>{resolve-uri($p||'./.', 'http://example.com')}</resolve>
            
            <!-- variants of one level up, ends with "/x/" -->
            <resolve>{resolve-uri($p||'..')}</resolve>
            <resolve>{resolve-uri($p||'../')}</resolve>
            <resolve>{resolve-uri($p||'../.')}</resolve>
            <resolve>{resolve-uri($p||'.././')}</resolve>
            <resolve>{resolve-uri($p||'.././')}</resolve>
            <resolve>{resolve-uri($p||'./././.././.')}</resolve>
            
            <!-- tests overlap of dotted path, where multiple dots on the right of a non-dotted segment could (with a wrong algo) potentially remove dotted elements further to the left -->
            <resolve>{resolve-uri($p||'./X/Y/Z/../W/../../.././..')}</resolve>
            <resolve>{resolve-uri($p||'../../.././X/Y/Z/../W/../../.././../v/w/x/')}</resolve>
            
            <!-- each following line ends with a lower letter in the alphabet, starting with "/w/" -->
            <resolve>{resolve-uri($p||'../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            
            <!-- variants that should end with "/a/" -->
            <resolve>{resolve-uri($p||'./././../../../../../../../../../././././../../../../../../../../../../../../../../././.')}</resolve>
            
            <!-- variants that try to get past the root, should return root with dotted parts removed -->
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'../../../../../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
            <resolve>{resolve-uri($p||'/../../../../../../../../../../../../../../../../../../../../../../../')}</resolve>
        </out>
    </xsl:template>

</xsl:stylesheet>
