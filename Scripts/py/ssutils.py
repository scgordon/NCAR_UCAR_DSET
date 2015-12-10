#!/usr/bin/python

import json
import xlwt
from xlwt import *
import xlrd

## write the header row in the worksheet.
def writeHeaders(sheet,rubric):
	##print "adding header for rubric type="+rubric
	font = Font()
	font.name = "Calibri"
	font.bold = True;
	style = XFStyle()
	style.font = font
	if (rubric == "CSW"):
		sheet.write_merge(0,0,10,14,"CSWAdditionalQueryables")
		sheet.write_merge(0,0,15,19,"CSWCoreQueryables")
		sheet.write_merge(0,0,20,24,"CSWCoreReturnables")
	elif (rubric == "UMM-C"):
		sheet.write_merge(0,0,10,14,"UMM-C.Required")
		sheet.write_merge(0,0,15,19,"UMM-C.Highly Recommended")
		sheet.write_merge(0,0,20,24,"UMM-C.Recommended")
	else:
		sheet.write_merge(0,0,10,14,"DataCite3.1Mandatory")
		sheet.write_merge(0,0,15,19,"DataCite3.1Recommended")
		sheet.write_merge(0,0,20,24,"DataCite3.1Optional")
	col = 0
	col = addTitle(sheet,"Data Center",col,style)
	col = addTitle(sheet,"RecordName",col,style)
	col = addTitle(sheet,"Dialect",col,style)
	col = addTitle(sheet,"Date",col,style)
	col = addTitle(sheet,"RubricType",col,style)
	col = addTitle(sheet,"RubricVersion",col,style)
	col = addTitle(sheet,"RubricMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Signature",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col = addTitle(sheet,"Max",col,style)
	col = addTitle(sheet,"DialectMax",col,style)
	col = addTitle(sheet,"Exist",col,style)
	col = addTitle(sheet,"Count",col,style)
	col = addTitle(sheet,"Spiral %",col,style)
	col  = addItems(sheet,col,style,"e",rubric)
	col  = addItems(sheet,col,style,"c",rubric)

def addItems(sheet,col,style,val,rubric):
	col = addTitle(sheet,"1.1."+val,col,style)
	col = addTitle(sheet,"1.2."+val,col,style)
	col = addTitle(sheet,"1.3."+val,col,style)
	col = addTitle(sheet,"1.4."+val,col,style)
	col = addTitle(sheet,"1.5."+val,col,style)
	col = addTitle(sheet,"1.6."+val,col,style)
	col = addTitle(sheet,"1.7."+val,col,style)
	col = addTitle(sheet,"1.8."+val,col,style)
	if ((rubric == "CSW") or (rubric == "UMM-C")): 
		col = addTitle(sheet,"1.9."+val,col,style)
		col = addTitle(sheet,"1.10."+val,col,style)
	if (rubric == "UMM-C"): 
		col = addTitle(sheet,"1.11."+val,col,style)
		col = addTitle(sheet,"1.12."+val,col,style)
		col = addTitle(sheet,"1.13."+val,col,style)
		col = addTitle(sheet,"1.14."+val,col,style)
		col = addTitle(sheet,"1.15."+val,col,style)
		col = addTitle(sheet,"1.16."+val,col,style)
		col = addTitle(sheet,"1.17."+val,col,style)
		col = addTitle(sheet,"1.18."+val,col,style)
		col = addTitle(sheet,"1.19."+val,col,style)
		col = addTitle(sheet,"1.20."+val,col,style)
		col = addTitle(sheet,"1.21."+val,col,style)
		col = addTitle(sheet,"1.22."+val,col,style)
		col = addTitle(sheet,"1.23."+val,col,style)
		col = addTitle(sheet,"1.24."+val,col,style)
		col = addTitle(sheet,"1.25."+val,col,style)
		col = addTitle(sheet,"1.26."+val,col,style)
		col = addTitle(sheet,"1.27."+val,col,style)
		col = addTitle(sheet,"1.28."+val,col,style)
		col = addTitle(sheet,"1.29."+val,col,style)
		col = addTitle(sheet,"1.30."+val,col,style)
		col = addTitle(sheet,"1.31."+val,col,style)
		col = addTitle(sheet,"1.32."+val,col,style)
		col = addTitle(sheet,"1.33."+val,col,style)
		col = addTitle(sheet,"1.34."+val,col,style)
		col = addTitle(sheet,"1.35."+val,col,style)
		col = addTitle(sheet,"1.36."+val,col,style)
		col = addTitle(sheet,"1.37."+val,col,style)
	col = addTitle(sheet,"2.1."+val,col,style)
	col = addTitle(sheet,"2.2."+val,col,style)
	col = addTitle(sheet,"2.3."+val,col,style)
	col = addTitle(sheet,"2.4."+val,col,style)
	col = addTitle(sheet,"2.5."+val,col,style)
	col = addTitle(sheet,"2.6."+val,col,style)
	if ((rubric == "CSW") or (rubric == "DCITE")):
		col = addTitle(sheet,"2.7."+val,col,style)
		col = addTitle(sheet,"2.8."+val,col,style)
		col = addTitle(sheet,"2.9."+val,col,style)
		col = addTitle(sheet,"2.10."+val,col,style)
	if (rubric == "CSW"):
		col = addTitle(sheet,"2.11."+val,col,style)
		col = addTitle(sheet,"2.12."+val,col,style)
		col = addTitle(sheet,"2.13."+val,col,style)
		col = addTitle(sheet,"2.14."+val,col,style)
		col = addTitle(sheet,"2.15."+val,col,style)
	col = addTitle(sheet,"3.1."+val,col,style)
	col = addTitle(sheet,"3.2."+val,col,style)
	col = addTitle(sheet,"3.3."+val,col,style)
	col = addTitle(sheet,"3.4."+val,col,style)
	col = addTitle(sheet,"3.5."+val,col,style)
	col = addTitle(sheet,"3.6."+val,col,style)
	if ((rubric == "CSW") or (rubric == "UMM-C")):
		col = addTitle(sheet,"3.7."+val,col,style)
		col = addTitle(sheet,"3.8."+val,col,style)
		col = addTitle(sheet,"3.9."+val,col,style)
	if (rubric == "UMM-C"): 
		col = addTitle(sheet,"3.10."+val,col,style)
		col = addTitle(sheet,"3.11."+val,col,style)
		col = addTitle(sheet,"3.12."+val,col,style)
		col = addTitle(sheet,"3.13."+val,col,style)
		col = addTitle(sheet,"3.14."+val,col,style)
		col = addTitle(sheet,"3.15."+val,col,style)
		col = addTitle(sheet,"3.16."+val,col,style)
		col = addTitle(sheet,"3.17."+val,col,style)
		col = addTitle(sheet,"3.18."+val,col,style)
		col = addTitle(sheet,"3.19."+val,col,style)
		col = addTitle(sheet,"3.20."+val,col,style)
		col = addTitle(sheet,"3.21."+val,col,style)
		col = addTitle(sheet,"3.22."+val,col,style)
		col = addTitle(sheet,"3.23."+val,col,style)
		col = addTitle(sheet,"3.24."+val,col,style)
		col = addTitle(sheet,"3.25."+val,col,style)
	return col

def addTitle(sheet,title,col,style):
	row = 1
	sheet.write(row,col,title, style)
	return col+1

	

