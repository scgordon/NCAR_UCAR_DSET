<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/" xmlns:echo="http://www.echo.nasa.gov/ingest/schemas/operations/" xmlns:eos="http://earthdata.nasa.gov/schema/eos" xmlns:serf="http://gcmd.gsfc.nasa.gov/xml/serf" xmlns:cw="http://www.ngdc.noaa.gov/metadata/published/xsd/crosswalk.xsd"
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
            name="ISO-1_Discovery-Mandatory.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='title']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='summary']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='date_modified']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"/><xsl:sequence
                select="if(exists(/netcdf/attribute[@name='geospatial_lat_max'])) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='title']/@value)"/><xsl:sequence select="count(/netcdf/attribute[@name='summary']/@value)"
                /><xsl:sequence select="count(/netcdf/attribute[@name='date_modified']/@value)"/><xsl:sequence select="count(/netcdf/attribute[@name='creator_name']/@value)"/><xsl:sequence select="count(/netcdf/attribute[@name='geospatial_lat_max'])"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts)"
            /><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Title",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e269" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='title']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e269)"
            /><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e269" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='title']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e269)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='title']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='title']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of
            select="count(/netcdf/attribute[@name='title']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"A short description of the resource. The title should be descriptive enough so that when a user is presented with a list of titles the general content of the data set can be determined."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Abstract",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Mandatory.itemExists.d1e496" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='summary']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e496)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e496" as="xs:integer+"><xsl:sequence
                select="count(/netcdf/attribute[@name='summary']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e496)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='summary']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/attribute[@name='summary']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='summary']/@value)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Desciption in Catalog Services for the Web.",</xsl:text><xsl:text>"description":"A paragraph describing the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Modified Date",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e4240" as="xs:integer+"><xsl:sequence
                select="if(exists(/netcdf/attribute[@name='date_modified']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e4240)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e4240" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='date_modified']/@value)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e4240)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='date_modified']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/attribute[@name='date_modified']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='date_modified']/@value)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Date on which the metadata record (not the resource) was created or updated within the catalogue."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Contact",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e922" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e922)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e922" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='creator_name']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e922)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='creator_name']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='creator_name']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person currently responsible for the metadata."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Bounding Box",</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemExists.d1e4290" as="xs:integer+"
                ><xsl:sequence select="if(exists(/netcdf/attribute[@name='geospatial_lat_max'])) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemExists.d1e4290)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Mandatory.itemCounts.d1e4290" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='geospatial_lat_max'])"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Mandatory.itemCounts.d1e4290)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='geospatial_lat_max]",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/attribute[@name='geospatial_lat_max'])) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='geospatial_lat_max'])"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"This concept is called Coverage in the CSW Specification",</xsl:text><xsl:text>"description":"A bounding box for identifying a geographic area of interest"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Topic Category",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"High level category enumeration used in ISO"</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"ISO-1 for Data Discovery - Conditional",</xsl:text><xsl:text>"code":"ISO-1_Discovery-Conditional",</xsl:text><xsl:text>"description":"This spiral includes conditional ISO 19115-1 attributes for data discovery. This list of attributes was obtained from table F.1 of the ISO 19115-1 Specification.",</xsl:text><xsl:text>"maximum":"2",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Conditional.itemExists" as="xs:integer+"><xsl:text>0</xsl:text></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Conditional.itemCounts" as="xs:integer+"><xsl:text>0</xsl:text></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Conditional.itemCounts)"
        /><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Resource Language",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"The language of the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Type",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"A resource code identifying the type of resource; e.g. dataset, a collection, an application (See MD_ScopeCode) for which the metadata describes."</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"title":"ISO-1 for Data Discovery - Optional",</xsl:text><xsl:text>"code":"ISO-1_Discovery-Optional",</xsl:text><xsl:text>"description":"This spiral includes optional ISO 19115-1 attributes for data discovery. This list of attributes was obtained from table F.1 of the ISO 19115-1 Specification.",</xsl:text><xsl:text>"maximum":"11",</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemExists" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='keywords']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='date_created']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='id']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"/><xsl:sequence
                select="if(exists(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value | /netcdf/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/attribute[@name='geospatial_lon_resolution']/@value)) then 1 else 0"/><xsl:sequence select="if(exists(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value | /netcdf/attribute[@name='time_coverage_duration']/@value)) then 1 else 0"/><xsl:sequence
                select="if(exists(/netcdf/attribute[@name='geospatial_vertical_max']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'existTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='keywords']/@value)"/><xsl:sequence
                select="count(/netcdf/attribute[@name='date_created']/@value)"/><xsl:sequence select="count(/netcdf/attribute[@name='id']/@value)"/><xsl:sequence select="count(/netcdf/attribute[@name='creator_name']/@value)"/><xsl:sequence
                select="count(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value) + count(/netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value) + count(/netcdf/attribute[@name='geospatial_lat_resolution']/@value) + count(/netcdf/attribute[@name='geospatial_lon_resolution']/@value)"/><xsl:sequence select="count(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value) + count(/netcdf/attribute[@name='time_coverage_duration']/@value)"/><xsl:sequence
                select="count(/netcdf/attribute[@name='geospatial_vertical_max']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'countTotal'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts)"
        /><xsl:text>",
</xsl:text><xsl:text>
"items" : [
</xsl:text><xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Identifier",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"A phrase or string which uniquely identifies the metadata file/record."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Theme Keyword",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e634" as="xs:integer+"
                ><xsl:sequence select="if(exists(/netcdf/attribute[@name='keywords']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e634)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e634" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='keywords']/@value)"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e634)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='keywords']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='keywords']/@value)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='keywords']/@value)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"note":"The general identification keywords usually have a type of theme and are refered to as theme keywords. Other types and vocabularies are used for other information. Service Entry Resource Format (SERF) requires a Science and a Service GCMD Keyword. This concept is called Subject in the CSW Specification. ",</xsl:text><xsl:text>"description":"A word or phrase that describes some aspect of a resource. Can be one of several types."</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Creation/Revision Date",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e389" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='date_created']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e389)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts.d1e389" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='date_created']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e389)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='date_created']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='date_created']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='date_created']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The date the resource was created"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Identifier",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e2622" as="xs:integer+"><xsl:sequence
                select="if(exists(/netcdf/attribute[@name='id']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e2622)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e2622" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='id']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e2622)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='id']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='id']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='id']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"Identifier for the resource described by the metadata"</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Contact",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e997" as="xs:integer+"><xsl:sequence
                select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e997)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e997" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='creator_name']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of
            select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e997)"/><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='creator_name']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='creator_name']/@value)) then 1 else 0"
            /><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='creator_name']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The organization or person responsible for answering questions about the resource."</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Spatial Resolution",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6052" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value | /netcdf/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/attribute[@name='geospatial_lon_resolution']/@value)) then 1 else 0"
            /></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6052)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6052" as="xs:integer+"><xsl:sequence
                select="count(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value | /netcdf/attribute[@name='geospatial_lat_resolution']/@value | /netcdf/attribute[@name='geospatial_lon_resolution']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6052)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/CFMetadata/attribute[@name='geospatial_lat_resolution']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/CFMetadata/attribute[@name='geospatial_lon_resolution']/@value)"
            /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='geospatial_lat_resolution']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='geospatial_lat_resolution']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='geospatial_lat_resolution']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='geospatial_lon_resolution']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/attribute[@name='geospatial_lon_resolution']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='geospatial_lon_resolution']/@value)"
        /><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The nominal scale and/or spatial resolution of the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Temporal Extent",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6108" as="xs:integer+"><xsl:sequence
                select="if(exists(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value | /netcdf/attribute[@name='time_coverage_duration']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6108)"/><xsl:text>",
</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemCounts.d1e6108" as="xs:integer+"><xsl:sequence
                select="count(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value | /netcdf/attribute[@name='time_coverage_duration']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6108)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/CFMetadata/attribute[@name='time_coverage_duration']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>,</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='time_coverage_duration']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of
            select="if(exists(/netcdf/attribute[@name='time_coverage_duration']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='time_coverage_duration']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The temporal extent of the resource"</xsl:text><xsl:text>}</xsl:text>,
            <xsl:text>{
</xsl:text><xsl:text>"name":"Vertical Extent",</xsl:text><xsl:variable name="ISO-1_Discovery-Optional.itemExists.d1e6171" as="xs:integer+"><xsl:sequence select="if(exists(/netcdf/attribute[@name='geospatial_vertical_max']/@value)) then 1 else 0"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemExists.d1e6171)"/><xsl:text>",
</xsl:text><xsl:variable
            name="ISO-1_Discovery-Optional.itemCounts.d1e6171" as="xs:integer+"><xsl:sequence select="count(/netcdf/attribute[@name='geospatial_vertical_max']/@value)"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'count'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($ISO-1_Discovery-Optional.itemCounts.d1e6171)"
            /><xsl:text>",
</xsl:text><xsl:text>
"paths" : [
</xsl:text><xsl:text>
{</xsl:text><xsl:text>"path":"/netcdf/attribute[@name='geospatial_vertical_max']/@value",</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'exists'"/><xsl:text>":"</xsl:text><xsl:value-of select="if(exists(/netcdf/attribute[@name='geospatial_vertical_max']/@value)) then 1 else 0"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'count'"
            /><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="count(/netcdf/attribute[@name='geospatial_vertical_max']/@value)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text><xsl:text>],
</xsl:text><xsl:text>"description":"The vertical extent of the resource"</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Resource Lineage",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"A description of the source(s) and production process(es) used in producing the resource."</xsl:text><xsl:text>}</xsl:text>,
        <xsl:text>{
</xsl:text><xsl:text>"name":"Resource on-line Link",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"Online link referencing additional information about the resource."</xsl:text><xsl:text>}</xsl:text>, <xsl:text>{
</xsl:text><xsl:text>"name":"Metadata Use Constraints",</xsl:text><xsl:text>"exists":"-1",</xsl:text><xsl:text>"count":"-1",</xsl:text><xsl:text>"description":"Information about how the data may or may not be used after access is granted to assure the protection of privacy or intellectual property. This includes any special restrictions, legal prerequisites, terms and conditions, and/or limitations on using the data set. Data providers may request acknowledgement of the data from users and claim no responsibility for quality and completeness of data."</xsl:text><xsl:text>}</xsl:text>
        <xsl:text>]
</xsl:text><xsl:text>}</xsl:text><xsl:text>],</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Record'"/><xsl:text>":"</xsl:text><xsl:value-of select="document-uri(.)"/><xsl:text>",
</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="'Date'"/><xsl:text>":"</xsl:text><xsl:value-of select="current-date()"/><xsl:text>",
</xsl:text><xsl:text>"rubricType":"ISO-1",</xsl:text><xsl:text>"rubricVersion":"0.1",</xsl:text><xsl:text>"rubricMax":"19",</xsl:text><xsl:variable
            name="rubricExists" as="xs:integer+"><xsl:sequence select="$ISO-1_Discovery-Mandatory.itemExists"/><xsl:sequence select="$ISO-1_Discovery-Conditional.itemExists"/><xsl:sequence select="$ISO-1_Discovery-Optional.itemExists"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricExists'"/><xsl:text>":"</xsl:text><xsl:value-of select="sum($rubricExists)"/><xsl:text>",
</xsl:text><xsl:variable name="rubricCounts" as="xs:integer+"><xsl:sequence
                select="$ISO-1_Discovery-Mandatory.itemCounts"/><xsl:sequence select="$ISO-1_Discovery-Conditional.itemCounts"/><xsl:sequence select="$ISO-1_Discovery-Optional.itemCounts"/></xsl:variable><xsl:text>"</xsl:text><xsl:value-of select="'rubricCounts'"/><xsl:text>"</xsl:text><xsl:text>:</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="sum($rubricCounts)"/><xsl:text>"
</xsl:text><xsl:text>}</xsl:text></xsl:template>
</xsl:stylesheet>