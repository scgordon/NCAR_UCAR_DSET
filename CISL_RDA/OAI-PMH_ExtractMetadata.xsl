<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/OAI-PMH/GetRecord/record/metadata">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>
