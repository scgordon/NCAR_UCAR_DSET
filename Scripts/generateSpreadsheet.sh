#!/bin/bash
/Users/scgordon/NCAR_UCAR_DSET/Scripts/generateSS.py `find /Users/scgordon/NCAR_UCAR_DSET/Labs -name "*.json" | grep ISO-1` &&
/Users/scgordon/NCAR_UCAR_DSET/Scripts/generateSS.py `find /Users/scgordon/NCAR_UCAR_DSET/Labs -name "*.json" | grep DCITE`
