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
{</xsl:text><xsl:text>"title":"ISO-1 for Data Discovery - Mandatory",</xsl:text><xsl:text>"code":"ISO-1_Discovery-Mandatory",</xsl:text><xsl:text>"description":"This spiral includes mandatory ISO 19115-1 attributes for data discovery. This list of attributes was obtained from table F.1 of the ISO 19115-1 Specification.",</xsl:text><xsl:text>"maximum":"6",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Mandatory.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts)"
            /><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e269" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e269)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e269" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:title/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e269)"
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
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e496" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e496)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e496" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e496)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:abstract/gco:CharacterString)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Modified Date",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e4240" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e4240)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e4240" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e4240)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:dateInfo/cit:CI_Date[cit:dateType/cit:CI_DateTypeCode='lastUpdate']/cit:date/gco:DateTime)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Date on which the metadata record (not the resource) was created or updated within the catalogue."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Contact",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e922" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e922)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e922" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e922)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:contact/cit:CI_Responsibility)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person currently responsible for the metadata."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Bounding Box",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e4290"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e4290)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e4290" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e4290)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:extent/gex:EX_Extent/gex:geographicElement/gex:EX_GeographicBoundingBox//*)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Coverage in the CSW Specification",</xsl:text><xsl:text>"description":"A bounding box for identifying a geographic area of interest"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Topic Category",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e597" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e597)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e597" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e597)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:topicCategory/mri:MD_TopicCategoryCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"High level category enumeration used in ISO"</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"ISO-1 for Data Discovery - Conditional",</xsl:text><xsl:text>"code":"ISO-1_Discovery-Conditional",</xsl:text><xsl:text>"description":"This spiral includes conditional ISO 19115-1 attributes for data discovery. This list of attributes was obtained from table F.1 of the ISO 19115-1 Specification.",</xsl:text><xsl:text>"maximum":"2",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Conditional.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemCounts" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode) + count(/mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemCounts)"/><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Language",</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemExists.d1e9088"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemExists.d1e9088)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemCounts.d1e9088"
            as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:defaultLocale/lan:PT_Locale/lan:language/lan:LanguageCode | /mdb:MD_Metadata/mdb:otherLocale/lan:PT_Locale/lan:language/lan:LanguageCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemCounts.d1e9088)"
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
</xsl:text><xsl:text>"name":"Resource Type",</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemExists.d1e5997" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemExists.d1e5997)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemCounts.d1e5997" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemCounts.d1e5997)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:metadataScope/mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A resource code identifying the type of resource; e.g. dataset, a collection, an application (See MD_ScopeCode) for which the metadata describes."</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"ISO-1 for Data Discovery - Optional",</xsl:text><xsl:text>"code":"ISO-1_Discovery-Optional",</xsl:text><xsl:text>"description":"This spiral includes optional ISO 19115-1 attributes for data discovery. This list of attributes was obtained from table F.1 of the ISO 19115-1 Specification.",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
                /><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)) then 1 else 0"/><xsl:sequence select="if(exists(/*/mdb:identificationInfo/*/mri:spatialResolution)) then 1 else 0"/><xsl:sequence
                select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)) then 1 else 0"/><xsl:sequence select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)) then 1 else 0"/><xsl:sequence select="if(exists(/*/mdb:resourceLineage/mrl:LI_Lineage)) then 1 else 0"/><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)) then 1 else 0"
                /><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString | /mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime) + count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
                /><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)"/><xsl:sequence select="count(/*/mdb:identificationInfo/*/mri:spatialResolution)"/><xsl:sequence select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)"/><xsl:sequence
                select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)"/><xsl:sequence select="count(/*/mdb:resourceLineage/mrl:LI_Lineage)"/><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information']) + count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information']) + count(/*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)"
                /><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString) + count(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts)"
            /><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Identifier",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e4209" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($ISO-1_Discovery-Optional.itemExists.d1e4209)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e4209" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e4209)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:metadataIdentifier/mcc:MD_Identifier)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A phrase or string which uniquely identifies the metadata file/record."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Theme Keyword",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e634"
            as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e634)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:descriptiveKeywords/mri:MD_Keywords[normalize-space(mri:type/mri:MD_KeywordTypeCode)='theme']/mri:keyword/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e634)"
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
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e389" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e389)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e389" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='revision']/cit:date/gco:DateTime | /mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='publication']/cit:date/gco:DateTime)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e389)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:date/cit:CI_Date[normalize-space(cit:dateType/cit:CI_DateTypeCode)='creation']/cit:date/gco:DateTime)) then 1 else 0"/><xsl:text>",
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
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemExists.d1e2622" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e2622)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts.d1e2622" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:citation/cit:CI_Citation/cit:identifier/mcc:MD_Identifier/mcc:code/gco:CharacterString)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e2622)"
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
</xsl:text><xsl:text>"name":"Resource Contact",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e997" as="xs:integer+"><xsl:sequence select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e997)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e997" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($ISO-1_Discovery-Optional.itemCounts.d1e997)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:identificationInfo/*/mri:pointOfContact)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person responsible for answering questions about the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Resolution",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemExists.d1e6052" as="xs:integer+"><xsl:sequence select="if(exists(/*/mdb:identificationInfo/*/mri:spatialResolution)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6052)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6052" as="xs:integer+"><xsl:sequence
                select="count(/*/mdb:identificationInfo/*/mri:spatialResolution)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6052)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/*/mdb:identificationInfo/*/mri:spatialResolution",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/*/mdb:identificationInfo/*/mri:spatialResolution)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/*/mdb:identificationInfo/*/mri:spatialResolution)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The nominal scale and/or spatial resolution of the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Temporal Extent",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6099" as="xs:integer+"><xsl:sequence select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6099)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6099" as="xs:integer+"><xsl:sequence select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6099)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:temporalElement/gex:EX_TemporalExtent//*)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The temporal extent of the resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Vertical Extent",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6162" as="xs:integer+"><xsl:sequence select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6162)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6162" as="xs:integer+"><xsl:sequence select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6162)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/*/mri:MD_DataIdentification/mri:extent/gex:EX_Extent/gex:verticalElement/gex:EX_VerticalExtent)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The vertical extent of the resource"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Lineage",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6200" as="xs:integer+"><xsl:sequence select="if(exists(/*/mdb:resourceLineage/mrl:LI_Lineage)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6200)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6200" as="xs:integer+"><xsl:sequence select="count(/*/mdb:resourceLineage/mrl:LI_Lineage)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6200)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/*/mdb:resourceLineage/mrl:LI_Lineage",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/*/mdb:resourceLineage/mrl:LI_Lineage)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/*/mdb:resourceLineage/mrl:LI_Lineage)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A description of the source(s) and production process(es) used in producing the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource on-line Link",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6218" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6218)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6218" as="xs:integer+"><xsl:sequence
                select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'] | /*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6218)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information']",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'])) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:distributor/mrd:MD_Distributor/mrd:distributorTransferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'])"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information']",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'])) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/mdb:MD_Metadata/mdb:distributionInfo/mrd:MD_Distribution/mrd:transferOptions/mrd:MD_DigitalTransferOptions/mrd:onLine/cit:CI_OnlineResource[normalize-space(cit:function/cit:CI_OnLineFunctionCode)='information'])"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource",</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/*/mri:MD_DataIdentification/mri:citation/cit:CI_Citation/cit:onlineResource/cit:CI_OnlineResource)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Online link referencing additional information about the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Use Constraints",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e4909" as="xs:integer+"><xsl:sequence
                select="if(exists(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString | /mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e4909)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts.d1e4909" as="xs:integer+"><xsl:sequence select="count(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString | /mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e4909)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_Constraints/mco:useLimitation/gco:CharacterString)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/mdb:MD_Metadata/mdb:metadataConstraints/mco:MD_LegalConstraints/mco:useConstraints/mco:MD_RestrictionCode)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Information about how the data may or may not be used after access is granted to assure the protection of privacy or intellectual property. This includes any special restrictions, legal prerequisites, terms and conditions, and/or limitations on using the data set. Data providers may request acknowledgement of the data from users and claim no responsibility for quality and completeness of data."</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"/><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"/><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"/><xsl:text>",
</xsl:text><xsl:text>"rubricType":"ISO-1",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"19",</xsl:text><xsl:variable
            name="rubricExists" as="xs:integer+"><xsl:sequence select="$ISO-1_Discovery-Mandatory.itemExists"/><xsl:sequence select="$ISO-1_Discovery-Conditional.itemExists"/><xsl:sequence select="$ISO-1_Discovery-Optional.itemExists"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"/><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence
                select="$ISO-1_Discovery-Mandatory.itemCounts"/><xsl:sequence select="$ISO-1_Discovery-Conditional.itemCounts"/><xsl:sequence select="$ISO-1_Discovery-Optional.itemCounts"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template>
</xsl:stylesheet>
