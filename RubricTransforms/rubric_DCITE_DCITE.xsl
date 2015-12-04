<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd" xmlns:thredds="http://www.unidata.ucar.edu/namespaces/thredds/InvCatalog/v1.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fgdc="http://www.fgdc.gov/metadata/csdgm" version="2.0"><xsl:param name="recordSetPath"></xsl:param><xsl:param name="fileNamePattern"></xsl:param><xsl:output method="text"></xsl:output><xsl:template match="/"><xsl:variable name="xmlFilesSelect" select="concat($recordSetPath, '?select=',$fileNamePattern)"></xsl:variable><xsl:text>{"records": [</xsl:text><xsl:for-each select="collection(iri-to-uri($xmlFilesSelect))"><xsl:call-template name="writeSpirals"></xsl:call-template></xsl:for-each><xsl:text>]}</xsl:text></xsl:template><xsl:template name="writeSpirals"><xsl:if test="position()!=1"><xsl:text>,</xsl:text></xsl:if><xsl:text>{"spirals": [</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Mandatory",</xsl:text><xsl:text>"code":"DataCite3.1Mandatory",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"8",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/resource/identifier)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/identifier/@identifierType)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/creators/creator | /resource/creators/creator/affiliation)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@schemeURI)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/titles/title)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/publisher)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts" as="xs:integer+"><xsl:sequence select="count(/resource/identifier)"></xsl:sequence><xsl:sequence select="count(/resource/identifier/@identifierType)"></xsl:sequence><xsl:sequence select="count(/resource/creators/creator) + count(/resource/creators/creator/affiliation)"></xsl:sequence><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:sequence><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@schemeURI)"></xsl:sequence><xsl:sequence select="count(/resource/titles/title)"></xsl:sequence><xsl:sequence select="count(/resource/publisher)"></xsl:sequence><xsl:sequence select="count(/resource/dates/date)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e2635" as="xs:integer+"><xsl:sequence select="if(exists(/resource/identifier)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e2635)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e2635" as="xs:integer+"><xsl:sequence select="count(/resource/identifier)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e2635)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/identifier",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/identifier)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/identifier)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier Type",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e11193" as="xs:integer+"><xsl:sequence select="if(exists(/resource/identifier/@identifierType)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e11193)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e11193" as="xs:integer+"><xsl:sequence select="count(/resource/identifier/@identifierType)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e11193)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/identifier/@identifierType",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/identifier/@identifierType)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/identifier/@identifierType)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The type of identifier used to uniquely identify the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e3808" as="xs:integer+"><xsl:sequence select="if(exists(/resource/creators/creator | /resource/creators/creator/affiliation)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e3808)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e3808" as="xs:integer+"><xsl:sequence select="count(/resource/creators/creator | /resource/creators/creator/affiliation)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e3808)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator/affiliation",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator/affiliation)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator/affiliation)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"In CSW this concept is called Creator",</xsl:text><xsl:text>"description":"The principal author of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator Identifier",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e3985" as="xs:integer+"><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e3985)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e3985" as="xs:integer+"><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e3985)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator/nameIdentifier/@nameIdentifierScheme",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A unique identifier for a resource author or originator"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator Identifier Type",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e3997" as="xs:integer+"><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@schemeURI)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e3997)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e3997" as="xs:integer+"><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@schemeURI)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e3997)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator/nameIdentifier/@schemeURI",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator/nameIdentifier/@schemeURI)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator/nameIdentifier/@schemeURI)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The type of unique identifier for a resource author or originator"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e269" as="xs:integer+"><xsl:sequence select="if(exists(/resource/titles/title)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e269" as="xs:integer+"><xsl:sequence select="count(/resource/titles/title)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e269)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/titles/title",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/titles/title)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/titles/title)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Publisher",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e2126" as="xs:integer+"><xsl:sequence select="if(exists(/resource/publisher)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e2126)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e2126" as="xs:integer+"><xsl:sequence select="count(/resource/publisher)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e2126)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/publisher",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/publisher)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/publisher)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Publisher of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e389" as="xs:integer+"><xsl:sequence select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e389)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e389" as="xs:integer+"><xsl:sequence select="count(/resource/dates/date)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e389)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/dates/date",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/dates/date)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The date the resource was created"</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Recommended",</xsl:text><xsl:text>"code":"DataCite3.1Recommended",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/resource/subjects/subject)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/subjects/subject/@subjectScheme | /resource/subjects/subject/@schemeURI)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/contributors/contributor/contributorName)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/contributors/contributor/@contributorType)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/resourceType)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/relatedIdentifiers/relatedIdentifier)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/descriptions/description)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/geoLocations/geoLocation)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts" as="xs:integer+"><xsl:sequence select="count(/resource/subjects/subject)"></xsl:sequence><xsl:sequence select="count(/resource/subjects/subject/@subjectScheme) + count(/resource/subjects/subject/@schemeURI)"></xsl:sequence><xsl:sequence select="count(/resource/contributors/contributor/contributorName)"></xsl:sequence><xsl:sequence select="count(/resource/contributors/contributor/@contributorType)"></xsl:sequence><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:sequence><xsl:sequence select="count(/resource/creators/creator/nameIdentifier)"></xsl:sequence><xsl:sequence select="count(/resource/dates/date)"></xsl:sequence><xsl:sequence select="count(/resource/resourceType)"></xsl:sequence><xsl:sequence select="count(/resource/relatedIdentifiers/relatedIdentifier)"></xsl:sequence><xsl:sequence select="count(/resource/descriptions/description)"></xsl:sequence><xsl:sequence select="count(/resource/geoLocations/geoLocation)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Theme Keyword",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e634" as="xs:integer+"><xsl:sequence select="if(exists(/resource/subjects/subject)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/resource/subjects/subject)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e634)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/subjects/subject",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/subjects/subject)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/subjects/subject)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Keyword Vocabulary",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e865" as="xs:integer+"><xsl:sequence select="if(exists(/resource/subjects/subject/@subjectScheme | /resource/subjects/subject/@schemeURI)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e865)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e865" as="xs:integer+"><xsl:sequence select="count(/resource/subjects/subject/@subjectScheme | /resource/subjects/subject/@schemeURI)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e865)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/subjects/subject/@subjectScheme",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/subjects/subject/@subjectScheme)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/subjects/subject/@subjectScheme)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/subjects/subject/@schemeURI",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/subjects/subject/@schemeURI)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/subjects/subject/@schemeURI)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"DIF, ECHO and ECS require that theme keywords come from the Global Change Master Directory list.",</xsl:text><xsl:text>"description":"If you are following a guideline or using a shared vocabulary for the words/phrases in your 'keywords' attribute, put the name of that guideline here."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Name",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e4442" as="xs:integer+"><xsl:sequence select="if(exists(/resource/contributors/contributor/contributorName)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e4442)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e4442" as="xs:integer+"><xsl:sequence select="count(/resource/contributors/contributor/contributorName)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e4442)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/contributors/contributor/contributorName",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/contributors/contributor/contributorName)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/contributors/contributor/contributorName)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Contributor to the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Role",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e9402" as="xs:integer+"><xsl:sequence select="if(exists(/resource/contributors/contributor/@contributorType)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e9402)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e9402" as="xs:integer+"><xsl:sequence select="count(/resource/contributors/contributor/@contributorType)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e9402)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/contributors/contributor/@contributorType",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/contributors/contributor/@contributorType)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/contributors/contributor/@contributorType)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The role of any individuals or institutions that contributed to the creation of the data."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Responsible Party Identifier Type",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e1258" as="xs:integer+"><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e1258)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e1258" as="xs:integer+"><xsl:sequence select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e1258)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator/nameIdentifier/@nameIdentifierScheme",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator/nameIdentifier/@nameIdentifierScheme)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The type of a unique identifier for a person or an organization"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Responsible Party Identifier",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e1246" as="xs:integer+"><xsl:sequence select="if(exists(/resource/creators/creator/nameIdentifier)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e1246)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e1246" as="xs:integer+"><xsl:sequence select="count(/resource/creators/creator/nameIdentifier)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e1246)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/creators/creator/nameIdentifier",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/creators/creator/nameIdentifier)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/creators/creator/nameIdentifier)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A unique identifier for a person or an organization"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e389" as="xs:integer+"><xsl:sequence select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e389)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e389" as="xs:integer+"><xsl:sequence select="count(/resource/dates/date)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e389)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/dates/date",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/dates/date)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/dates/date)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The date the resource was created"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Type",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e5992" as="xs:integer+"><xsl:sequence select="if(exists(/resource/resourceType)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e5992)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e5992" as="xs:integer+"><xsl:sequence select="count(/resource/resourceType)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e5992)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/resourceType",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/resourceType)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/resourceType)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A resource code identifying the type of resource; e.g. dataset, a collection, an application (See MD_ScopeCode) for which the metadata describes."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Related Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e2711" as="xs:integer+"><xsl:sequence select="if(exists(/resource/relatedIdentifiers/relatedIdentifier)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e2711)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e2711" as="xs:integer+"><xsl:sequence select="count(/resource/relatedIdentifiers/relatedIdentifier)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e2711)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/relatedIdentifiers/relatedIdentifier",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/relatedIdentifiers/relatedIdentifier)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/relatedIdentifiers/relatedIdentifier)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for a resource related to the resource being described."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e496" as="xs:integer+"><xsl:sequence select="if(exists(/resource/descriptions/description)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e496" as="xs:integer+"><xsl:sequence select="count(/resource/descriptions/description)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e496)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/descriptions/description",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/descriptions/description)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/descriptions/description)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Extent",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e7355" as="xs:integer+"><xsl:sequence select="if(exists(/resource/geoLocations/geoLocation)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e7355)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e7355" as="xs:integer+"><xsl:sequence select="count(/resource/geoLocations/geoLocation)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e7355)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/geoLocations/geoLocation",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/geoLocations/geoLocation)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/geoLocations/geoLocation)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The spatial extent of the resource."</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Optional",</xsl:text><xsl:text>"code":"DataCite3.1Optional",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"6",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/resource/language)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/identifier)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/sizes/size)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/formats/format)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/version)) then 1 else 0"></xsl:sequence><xsl:sequence select="if(exists(/resource/rightsList/rights)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts" as="xs:integer+"><xsl:sequence select="count(/resource/language)"></xsl:sequence><xsl:sequence select="count(/resource/identifier)"></xsl:sequence><xsl:sequence select="count(/resource/sizes/size)"></xsl:sequence><xsl:sequence select="count(/resource/formats/format)"></xsl:sequence><xsl:sequence select="count(/resource/version)"></xsl:sequence><xsl:sequence select="count(/resource/rightsList/rights)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Language",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e9084" as="xs:integer+"><xsl:sequence select="if(exists(/resource/language)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e9084)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e9084" as="xs:integer+"><xsl:sequence select="count(/resource/language)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e9084)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/language",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/language)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/language)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The language of the resource."</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e2635" as="xs:integer+"><xsl:sequence select="if(exists(/resource/identifier)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e2635)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e2635" as="xs:integer+"><xsl:sequence select="count(/resource/identifier)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e2635)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/identifier",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/identifier)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/identifier)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Transfer Size",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e5071" as="xs:integer+"><xsl:sequence select="if(exists(/resource/sizes/size)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e5071)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e5071" as="xs:integer+"><xsl:sequence select="count(/resource/sizes/size)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e5071)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/sizes/size",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/sizes/size)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/sizes/size)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The size of the digital resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Format",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e4505" as="xs:integer+"><xsl:sequence select="if(exists(/resource/formats/format)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e4505)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e4505" as="xs:integer+"><xsl:sequence select="count(/resource/formats/format)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e4505)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/formats/format",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/formats/format)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/formats/format)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The physical or digital manifestation of the resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Resource Version",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e2286" as="xs:integer+"><xsl:sequence select="if(exists(/resource/version)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e2286)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e2286" as="xs:integer+"><xsl:sequence select="count(/resource/version)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e2286)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/version",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/version)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/version)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Version of the cited resource"</xsl:text><xsl:text>}</xsl:text>,
<xsl:text>{
</xsl:text><xsl:text>"name":"Rights",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e4608" as="xs:integer+"><xsl:sequence select="if(exists(/resource/rightsList/rights)) then 1 else 0"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e4608)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e4608" as="xs:integer+"><xsl:sequence select="count(/resource/rightsList/rights)"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e4608)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/resource/rightsList/rights",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/resource/rightsList/rights)) then 1 else 0"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/resource/rightsList/rights)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about rights held in and over the resource"</xsl:text><xsl:text>}</xsl:text>
<xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"></xsl:value-of><xsl:text>",
</xsl:text><xsl:text>"rubricType":"DataCite",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"25",</xsl:text><xsl:variable name="rubricExists" as="xs:integer+"><xsl:sequence select="$DataCite3.1Mandatory.itemExists"></xsl:sequence><xsl:sequence select="$DataCite3.1Recommended.itemExists"></xsl:sequence><xsl:sequence select="$DataCite3.1Optional.itemExists"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"></xsl:value-of><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"></xsl:value-of><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence select="$DataCite3.1Mandatory.itemCounts"></xsl:sequence><xsl:sequence select="$DataCite3.1Recommended.itemCounts"></xsl:sequence><xsl:sequence select="$DataCite3.1Optional.itemCounts"></xsl:sequence></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"></xsl:value-of><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"></xsl:value-of><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template></xsl:stylesheet>