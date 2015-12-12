<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cat="http://standards.iso.org/iso/19115/-3/cat/1.0" xmlns:cit="http://standards.iso.org/iso/19115/-3/cit/1.0" xmlns:gcx="http://standards.iso.org/iso/19115/-3/gcx/1.0" xmlns:gex="http://standards.iso.org/iso/19115/-3/gex/1.0" xmlns:lan="http://standards.iso.org/iso/19115/-3/lan/1.0" xmlns:srv="http://standards.iso.org/iso/19115/-3/srv/2.0" xmlns:mas="http://standards.iso.org/iso/19115/-3/mas/1.0"
    xmlns:mcc="http://standards.iso.org/iso/19115/-3/mcc/1.0" xmlns:mco="http://standards.iso.org/iso/19115/-3/mco/1.0" xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/1.0" xmlns:mdb="http://standards.iso.org/iso/19115/-3/mdb/1.0" xmlns:mds="http://standards.iso.org/iso/19115/-3/mds/1.0" xmlns:mdt="http://standards.iso.org/iso/19115/-3/mdt/1.0" xmlns:mex="http://standards.iso.org/iso/19115/-3/mex/1.0" xmlns:mmi="http://standards.iso.org/iso/19115/-3/mmi/1.0"
    xmlns:mpc="http://standards.iso.org/iso/19115/-3/mpc/1.0" xmlns:mrc="http://standards.iso.org/iso/19115/-3/mrc/1.0" xmlns:mrd="http://standards.iso.org/iso/19115/-3/mrd/1.0" xmlns:mri="http://standards.iso.org/iso/19115/-3/mri/1.0" xmlns:mrl="http://standards.iso.org/iso/19115/-3/mrl/1.0" xmlns:mrs="http://standards.iso.org/iso/19115/-3/mrs/1.0" xmlns:msr="http://standards.iso.org/iso/19115/-3/msr/1.0" xmlns:mdq="http://standards.iso.org/iso/19157/-2/mdq/1.0"
    xmlns:mac="http://standards.iso.org/iso/19115/-3/mac/1.0" xmlns:gco="http://standards.iso.org/iso/19115/-3/gco/1.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd"
    xmlns:thredds="http://www.unidata.ucar.edu/namespaces/thredds/InvCatalog/v1.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fgdc="http://www.fgdc.gov/metadata/csdgm" version="2.0">
    <xsl:param name="recordSetPath"/>
    <xsl:param name="fileNamePattern"/>
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="xmlFilesSelect" select="concat($recordSetPath, '?select=',$fileNamePattern)"/>
        <xsl:text>{"records": [</xsl:text>
        <xsl:for-each select="collection(iri-to-uri($xmlFilesSelect))">
            <xsl:call-template name="writeSpirals"/>
        </xsl:for-each>
        <xsl:text>]}</xsl:text>
    </xsl:template>
    <xsl:template name="writeSpirals"><xsl:if test="position()!=1"
            ><xsl:text>,</xsl:text></xsl:if><xsl:text>{"spirals": [</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Mandatory",</xsl:text><xsl:text>"code":"DataCite3.1Mandatory",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"8",</xsl:text><xsl:variable
            name="DataCite3.1Mandatory.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author'] | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)) then 1 else 0"/><xsl:sequence select="if(exists(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author']) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)"/><xsl:sequence select="count(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts)"/><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e2622" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e2622)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e2622" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e2622)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier Type",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"The type of identifier used to uniquely identify the resource."</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e3798" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author'] | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e3798)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e3798" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author'] | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Mandatory.itemCounts.d1e3798)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author']",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author'])) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='author'])"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator']",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='originator'])"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"In CSW this concept is called Creator",</xsl:text><xsl:text>"description":"The principal author of the resource"</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator Identifier",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"A unique identifier for a resource author or originator"</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Author / Originator Identifier Type",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"The type of unique identifier for a resource author or originator"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e269" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e269)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e269" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e269)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Publisher",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e2119" as="xs:integer+"><xsl:sequence
                select="if(exists(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e2119)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e2119" as="xs:integer+"><xsl:sequence
                select="count(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e2119)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(//cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='publisher']/cit:party/cit:CI_Organisation/cit:name/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Publisher of the cited resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemExists.d1e389" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemExists.d1e389)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Mandatory.itemCounts.d1e389" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Mandatory.itemCounts.d1e389)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The date the resource was created"</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Recommended",</xsl:text><xsl:text>"code":"DataCite3.1Recommended",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable
            name="DataCite3.1Recommended.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
                /><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable
            name="DataCite3.1Recommended.itemCounts" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
                /><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts)"/><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Theme Keyword",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e634"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e634)"/><xsl:text>",
</xsl:text><xsl:variable
            name="DataCite3.1Recommended.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e634)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Keyword Vocabulary",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e865" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Recommended.itemExists.d1e865)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e865" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Recommended.itemCounts.d1e865)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:thesaurusName/cit:CI_Citation)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"DIF, ECHO and ECS require that theme keywords come from the Global Change Master Directory list.",</xsl:text><xsl:text>"description":"If you are following a guideline or using a shared vocabulary for the words/phrases in your 'keywords' attribute, put the name of that guideline here."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Name",</xsl:text><xsl:variable
            name="DataCite3.1Recommended.itemExists.d1e4444" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Recommended.itemExists.d1e4444)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e4444" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e4444)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility[normalize-space(cit:role/cit:CI_RoleCode)='manyOptions']/cit:party/cit:CI_Individual/cit:name/gco:CharacterString)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Contributor to the resource"</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Contributor Role",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e9406" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Recommended.itemExists.d1e9406)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e9406" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Recommended.itemCounts.d1e9406)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:citedResponsibleParty/cit:CI_Responsibility/cit:role/cit:CI_RoleCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The role of any individuals or institutions that contributed to the creation of the data."</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Responsible Party Identifier Type",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"The type of a unique identifier for a person or an organization"</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Responsible Party Identifier",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"A unique identifier for a person or an organization"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e389" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e389)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e389" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e389)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The date the resource was created"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Type",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e5997"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e5997)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e5997" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e5997)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A resource code identifying the type of resource; e.g. dataset, a collection, an application (See MD_ScopeCode) for which the metadata describes."</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Related Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e2698" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e2698)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e2698" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e2698)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:associatedResource/mri:MD_AssociatedResource/mri:name/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for a resource related to the resource being described."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable
            name="DataCite3.1Recommended.itemExists.d1e496" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e496)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e496" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e496)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Extent",</xsl:text><xsl:variable name="DataCite3.1Recommended.itemExists.d1e7366" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemExists.d1e7366)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Recommended.itemCounts.d1e7366" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Recommended.itemCounts.d1e7366)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:geographicElement//*)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The spatial extent of the resource."</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"DataCite Metadata Schema for the Publication and Citation of Research Data - Optional",</xsl:text><xsl:text>"code":"DataCite3.1Optional",</xsl:text><xsl:text>"description":"The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term 'dataset' in its broadest sense. We mean it to include not only numerical data, but any other research data outputs.",</xsl:text><xsl:text>"maximum":"6",</xsl:text><xsl:variable
            name="DataCite3.1Optional.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode) + count(/mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real) + count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts)"/><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Language",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e9088" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e9088)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e9088" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e9088)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The language of the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e2622" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e2622)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e2622" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e2622)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Transfer Size",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e5076" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e5076)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e5076" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e5076)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributionFormat/mrd:MD_Format/mrd:formatDistributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:transferSize/gco:Real)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The size of the digital resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Format",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e4507"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e4507)"/><xsl:text>",
</xsl:text><xsl:variable
            name="DataCite3.1Optional.itemCounts.d1e4507" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e4507)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:resourceFormat/mrd:MD_Format/mrd:formatSpecificationCitation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The physical or digital manifestation of the resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Version",</xsl:text><xsl:variable
            name="DataCite3.1Optional.itemExists.d1e2276" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e2276)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e2276"
            as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemCounts.d1e2276)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:edition/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Version of the cited resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Rights",</xsl:text><xsl:variable name="DataCite3.1Optional.itemExists.d1e4610" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($DataCite3.1Optional.itemExists.d1e4610)"/><xsl:text>",
</xsl:text><xsl:variable name="DataCite3.1Optional.itemCounts.d1e4610" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($DataCite3.1Optional.itemCounts.d1e4610)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:resourceConstraints/mco:MD_LegalConstraints)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about rights held in and over the resource"</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"/><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"/><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"/><xsl:text>",
</xsl:text><xsl:text>"rubricType":"DCITE",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"25",</xsl:text><xsl:variable
            name="rubricExists" as="xs:integer+"><xsl:sequence select="$DataCite3.1Mandatory.itemExists"/><xsl:sequence select="$DataCite3.1Recommended.itemExists"/><xsl:sequence select="$DataCite3.1Optional.itemExists"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"/><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence select="$DataCite3.1Mandatory.itemCounts"
                /><xsl:sequence select="$DataCite3.1Recommended.itemCounts"/><xsl:sequence select="$DataCite3.1Optional.itemCounts"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template>
</xsl:stylesheet>
