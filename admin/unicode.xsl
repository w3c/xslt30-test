<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:uc="http://www.unicode.org/ns/2003/ucd/1.0"
    xmlns:f="http://exselt.net"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes" method="text"/>
    <xsl:mode on-no-match="shallow-skip" />
    
    <xsl:template match="/">
        <xsl:variable name="res">
                <xsl:apply-templates />
        </xsl:variable>
        <xsl:variable name="grouped">
            <xsl:for-each-group select="$res/*" group-starting-with="*:character[(xs:integer(preceding-sibling::*[1]/@dec) + 1 != xs:integer(@dec)) or preceding-sibling::*[1]/@cat != @cat]">
                <group from="{current-group()[1]/@cp}" to="{current-group()[last()]/@cp}" count="{count(current-group())}">
                    <xsl:copy-of select="current-group()"/>
                </group>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:apply-templates select="$grouped/*" />
    </xsl:template>
    
    <xsl:template match="group" priority="10" expand-text="yes">
        <xsl:variable name="rangetest">
            <xsl:next-match />
        </xsl:variable>
        <xsl:value-of select="$rangetest, for $i in string-length($rangetest) to 76 return ' '" separator=""/>
        <xsl:text> (* {character[1]/@cat}, UC version: {character[1]/@version} *) &#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="group[@from = @to]" expand-text="yes">
        <xsl:text>            | 0x{@from} -> </xsl:text>
        <xsl:apply-templates select="*:character[1]" />        
    </xsl:template>
    
    <xsl:template match="group" expand-text="yes">
        <xsl:text>            | InRange 0x{@from} 0x{@to} -> </xsl:text>
        <xsl:apply-templates select="*:character[1]" />
    </xsl:template>
    
    <xsl:template match="character[@cat = 'Nl']">
        <xsl:text>UnicodeCategory.LetterNumber</xsl:text>
    </xsl:template>
    
    <xsl:template match="character[@cat = 'Nd']">
        <xsl:text>UnicodeCategory.DecimalDigitNumber</xsl:text>
    </xsl:template>
    
    <xsl:template match="character[@cat = 'No']">
        <xsl:text>UnicodeCategory.OtherNumber</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Lo']">
        <xsl:text>UnicodeCategory.OtherLetter</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Ll']">
        <xsl:text>UnicodeCategory.LowercaseLetter</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Lm']">
        <xsl:text>UnicodeCategory.ModifierLetter</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Lt']">
        <xsl:text>UnicodeCategory.TitlecaseLetter</xsl:text>
    </xsl:template>
    
    <xsl:template match="character[@cat = 'Lu']">
        <xsl:text>UnicodeCategory.UppercaseLetter</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Cc']">
        <xsl:text>UnicodeCategory.Control</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Cf']">
        <xsl:text>UnicodeCategory.Format</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Cn']">
        <!-- this is the property for characters not in the UC database, should not be hit -->
        <xsl:text>UnicodeCategory.OtherNotAssigned</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Co']">
        <xsl:text>UnicodeCategory.PrivateUse</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Cs']">
        <xsl:text>UnicodeCategory.Surrogate</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Mc']">
        <xsl:text>UnicodeCategory.SpacingCombiningMark</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Me']">
        <xsl:text>UnicodeCategory.EnclosingMark</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Mn']">
        <xsl:text>UnicodeCategory.NonSpacingMark</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Pc']">
        <xsl:text>UnicodeCategory.ConnectorPunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Pd']">
        <xsl:text>UnicodeCategory.DashPunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Pe']">
        <xsl:text>UnicodeCategory.ClosePunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Pf']">
        <xsl:text>UnicodeCategory.FinalQuotePunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Pi']">
        <xsl:text>UnicodeCategory.InitialQuotePunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Po']">
        <xsl:text>UnicodeCategory.OtherPunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Ps']">
        <xsl:text>UnicodeCategory.OpenPunctuation</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Sc']">
        <xsl:text>UnicodeCategory.CurrencySymbol</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Sk']">
        <xsl:text>UnicodeCategory.</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Sm']">
        <xsl:text>UnicodeCategory.ModifierSymbol</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'So']">
        <xsl:text>UnicodeCategory.OtherSymbol</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Zl']">
        <xsl:text>UnicodeCategory.LineSeparator</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Zp']">
        <xsl:text>UnicodeCategory.ParagraphSeparator</xsl:text>
    </xsl:template>

    <xsl:template match="character[@cat = 'Zs']">
        <xsl:text>UnicodeCategory.SpaceSeparator</xsl:text>
    </xsl:template>

    <xsl:template match="character">
        <!-- should not happen -->
        <xsl:text>UnicodeCategory.OtherNotYetFound</xsl:text>
    </xsl:template>

    <xsl:template match="uc:char[(@gc, ../@gc)[1] = ('Nd', 'No', 'Nl')][number((@age, ../@age)[1]) > 4.9]">
        <character cp="{@cp}" cat="{(@gc, ../@gc)[1]}" dec="{f:hexToDecimal(@cp)}" value="{@nv}" name="{@na}" version="{(@age, ../@age)[1]}" />
    </xsl:template>
    
    <xsl:function name="f:hexToDecimal">
        <xsl:param name="hex"/>
        <xsl:variable name="dec"
            select="string-length(substring-before('0123456789ABCDEF', substring($hex,1,1)))"/>
        <xsl:value-of select="
            if ($hex = '') then 0
            else $dec * math:pow(16, string-length($hex) - 1) + f:hexToDecimal(substring($hex,2))"/>
    </xsl:function>
</xsl:stylesheet>