<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

<!-- PURPOSE:  unclosed expression in AVT  -->
<?spec xslt#errors?><?error XTSE0350?>

<xsl:template match="/">
<A b="x{3}y{4"/>
</xsl:template>

</xsl:stylesheet>