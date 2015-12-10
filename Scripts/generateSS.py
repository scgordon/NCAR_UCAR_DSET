#!/Users/scgordon/anaconda/bin/python

import json
import xlwt
from xlwt import *
import xlrd
import sys
import os
sys.path.append('./py')
from 
Counter import *
from ssutils import writeHeaders

## initial data values
sig = Counter()
columns = {}
sheets = {}
sheetRows = {}
style1 = xlwt.easyxf('pattern: pattern solid, fore_colour light_green;')



def open_workbook(wbname):
	wb = xlwt.Workbook()
	return wb

def read_json(path):
	print "Opening "+path
	with open (path, "r") as myfile:
			tmpdata=str(myfile.read())
	## get rid of the double commas
	jsondata = tmpdata.replace(",\n,\n,",",\n");
	jsondata = jsondata.replace(",\n,",",\n");
	jsondata = jsondata.replace(",\n        ,",",\n");
	data = json.loads(jsondata)
	return data
	
## find the named worksheet object. If not found, create it.
def getDataSheet(sname):
	try:
		sheet = sheets[sname]
	except:
		sheet = wb.add_sheet(sname,cell_overwrite_ok=True)
		writeHeaders(sheet,sname)
		sheets[sname] = sheet
		sheetRows[sname] = 2
	return sheet

	
## extract the file specific data and add it to the worksheet. one row per file.
def file_specific_data(data,  cName, dName, rubricName):
	sname = rubricName
	signatureName = cName + "_" + dName + "_" + rubricName
	sheet =  getDataSheet(rubricName)
	row = sheetRows[rubricName]
	col = 0
	signature = ""
	##print rubricName+":"
	signatureCol = 10
	## write the record unique data
	for record in data["records"]:
		sheet.write(row,col,cName)
		col +=1
		sheet.write(row,col,os.path.basename(record["Record"]))
		col +=1
		sheet.write(row,col,dName)
		col +=1
		sheet.write(row,col,record["Date"])
		col +=1
		sheet.write(row,col,record["rubricType"])
		col +=1
		sheet.write(row,col,record["rubricVersion"])
		col +=1
		sheet.write(row,col,float(record["rubricMax"]))
		col +=1
		sheet.write(row,col,float(record["rubricExists"]))
		col +=1
		sheet.write(row,col,float(record["rubricCounts"]))
		col +=1
		signatureCol = col

		## write the spiral unique data
		spiralCount = 0
		for spiral in record['spirals']:
			col +=1
			sheet.write(row,col,float(spiral["maximum"]))
			col += 1
			existCount = float(spiral["maximum"]) - getExistCount(spiral)
			sheet.write(row,col,existCount)
			col += 1
			sheet.write(row,col,float(spiral["existTotal"]))
			signature += " "+str(spiral["existTotal"])
			col += 1
			sheet.write(row,col,float(spiral["countTotal"]))
			col += 1
			percent = float(float(spiral["existTotal"])/float(spiral["maximum"]))
			sheet.write(row,col,float(percent))
			spiralCount += 1

		## write the "exist" values from each item in the spiral
		for spiral in record['spirals']:
			items = ""
			for item in spiral["items"]:
				col +=1
				writeit(sheet,row,col,float(item["exists"]))
				items += " "+item['exists']
			##print "exists = "+items

		#write the "count" values from each item in the spiral
		for spiral in record['spirals']:
			items = ""
			for item in spiral["items"]:
				col +=1
				sheet.write(row,col,float(item["count"]))
				items += " "+item['exists']
			##print "count = "+items

		sheet.write(row,signatureCol,signature.lstrip())
		signature = ""
		row += 1
		sheetRows[rubricName] = row
		col = 0

def getExistCount(spiral):
		num = float(0)
		for item in spiral["items"]:
			itemVal = float(item['exists'])
			if (itemVal == -1):
				num += 1
		return num

def writeit(sheet, row, col, val) :
	if (val != 0):
		sheet.write(row,col,val,style1)
	else:
		sheet.write(row,col,val)
		
		
	
## main processing starts here
workbook_name = "data.xls"
wb = open_workbook(workbook_name)

##  loop through each of the files on the command line
for idx in range(1,len(sys.argv)):
	## get the path
	path = sys.argv[idx]
	##print "path="+path
	basename = os.path.basename(path)

	## now split out the colection, dialect, and filename
	words = path.split("/")
	collection = words[2]
	dialect = words[3]
	filename = words[5]

	## split the filename to extract the rubric type
	arry = filename.split("_")
	rubric = arry[1]

	## read and parse the input json file
	data = read_json(path)

	## and process the data
	file_specific_data(data,collection,dialect,rubric)

		
## now save the workbook
wb.save(workbook_name);
