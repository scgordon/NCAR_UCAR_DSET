#!/bin/bash
#
# This script creates a rubric for a dialect using a recommendation.
# The output is a file with the name rubric_"recommendation"_"dialect".xsl in the directory
# RubricTransforms/"dialect".
#
CrosswalkHome="/Users/scgordon/Crosswalks"
OutputHome="/Users/scgordon/metadig/result/CleanEML2.1.1/RubricTransforms"

    echo $OutputHome/"$1"/rubric_"$2"_"$1".xsl

    java net.sf.saxon.Transform \
    -s:$CrosswalkHome/AllCrosswalks.xml \
    -xsl:$CrosswalkHome/crosswalks.xsl \
    displayFormat=jsonRubric \
    spiralDisplayListString="$3"','"$4"','"$5" \
    dialectDisplayListString="$1" \
    rubricType="$2" \
    rubricDialect="$1" \
    recordSetPath=$CrosswalkHome \
    > $OutputHome/"$1"/rubric_"$2"_"$1".xsl