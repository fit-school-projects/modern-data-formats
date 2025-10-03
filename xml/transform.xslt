<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/root">
        <html>
            <head>
                <title>NHL franchise mode</title>
            </head>
            <body>
                <h1>NHL franchise</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="coach">
        <h2><xsl:value-of select="name"/></h2>
        <dl>
            <dt>Identifier</dt>
            <dd><xsl:value-of select="iri"/></dd>
            <dt>Level of experience</dt>
            <dd><xsl:value-of select="levelOfExperience"/></dd>
            <dt>Date of birth</dt>
            <dd><xsl:value-of select="dateOfBirth"/></dd>
            <dt>Is coaching team</dt>
            <xsl:for-each select="teams/teamIri">
                <xsl:variable name="iri_team"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//teams/team[iri = $iri_team]/title"/></dd>
            </xsl:for-each>
        </dl>
    </xsl:template>

    <xsl:template match="team">
        <h2><xsl:value-of select="title"/></h2>
        <dl>
            <dt>Identifier</dt>
            <dd><xsl:value-of select="iri"/></dd>
            <dt>Number of fans</dt>
            <dd><xsl:value-of select="numberOfFans"/></dd>
            <dt>Team is coached by</dt>
            <xsl:for-each select="coaches/coachIri">
                <xsl:variable name="iri_coach"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//coaches/coach[iri = $iri_coach]/name"/></dd>
            </xsl:for-each>
            <dt>Team has players:</dt>
            <xsl:for-each select="players/playerIri">
                <xsl:variable name="iri_player"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//players/player[iri = $iri_player]/name"/></dd>
            </xsl:for-each>
        </dl>
    </xsl:template>

    <xsl:template match="jersey">
        <h2>Jersey<xsl:number format=" 1"/></h2>
        <dl>
            <dt>Identifier</dt>
            <dd><xsl:value-of select="iri"/></dd>
            <dt>Size</dt>
            <dd><xsl:value-of select="size"/></dd>
            <dt>Number</dt>
            <dd><xsl:value-of select="number"/></dd>
            <dt>Jersey <xsl:number format="1"/> is used by</dt>
            <xsl:for-each select="players/playerIri">
                <xsl:variable name="iri_player"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//players/player[iri = $iri_player]/name"/></dd>
            </xsl:for-each>
        </dl>
    </xsl:template>

    <xsl:template match="xfactor">
        <h2><xsl:value-of select="title"/></h2>
        <dl>
            <dt>Identifier</dt>
            <dd><xsl:value-of select="iri"/></dd>
            <dt>Description</dt>
            <dd><xsl:value-of select="description"/></dd>
            <dt>Xfactor is performed by</dt>
            <xsl:for-each select="players/playerIri">
                <xsl:variable name="iri_player"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//players/player[iri = $iri_player]/name"/></dd>
            </xsl:for-each>
        </dl>
    </xsl:template>

    <xsl:template match="player">
        <h2><xsl:value-of select="name"/></h2>
        <dl>
            <dt>Identifier</dt>
            <dd><xsl:value-of select="iri"/></dd>
            <dt>Nicknames</dt>
            <xsl:for-each select="nicknames/nickname">
                <dd><xsl:value-of select="."/></dd>
            </xsl:for-each>

            <dt>Player excels with</dt>
            <xsl:for-each select="xfactors/xfactorIri">
                <xsl:variable name="iri_xfactor"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//xfactors/xfactor[iri = $iri_xfactor]/title"/></dd>
            </xsl:for-each>

           <dt>Player wears</dt>
            <xsl:for-each select="jerseys/jerseyIri">
                <xsl:variable name="iri_jersey"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//jerseys/jersey[iri = $iri_jersey]/iri"/></dd>
            </xsl:for-each>

            <dt>Player plays in</dt>
            <xsl:for-each select="teams/teamIri">
                <xsl:variable name="iri_team"><xsl:value-of select="."></xsl:value-of></xsl:variable> 
                <dd><xsl:value-of select="//teams/team[iri = $iri_team]/title"/></dd> 
            </xsl:for-each>
        </dl>
    </xsl:template>


    
    <xsl:template match="text()"/>
</xsl:stylesheet>
