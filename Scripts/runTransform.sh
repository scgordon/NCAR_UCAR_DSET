#!/bin/bash
mkdir -p /Users/scgordon/NCAR_UCAR_DSET/Labs/$1/$3/reports/ |
if [ $# = 3 ]; then
    java net.sf.saxon.Transform \
    -s:/Users/scgordon/NCAR_UCAR_DSET/Labs/dummy.xml \
    -xsl:/Users/scgordon/NCAR_UCAR_DSET/RubricTransforms/$3/rubric_$2_$3.xsl \
    fileNamePattern=*.xml \
    recordSetPath=/Users/scgordon/NCAR_UCAR_DSET/Labs/$1/$3/XML \
    > /Users/scgordon/NCAR_UCAR_DSET/Labs/$1/$3/reports/rubric_$2_$3.json
else
    echo 'runTransform collection (GHRC) rubric (CSW) dialect (DIF)'
fi
