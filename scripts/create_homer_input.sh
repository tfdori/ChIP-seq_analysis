#!/bin/bash


# Define input file prefixes
input_filelist="/home/jw0rtd/omics_data_analysis/ChIP_analysis/peak_filelist_test.txt"

# Define working directory
WORKING_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling"

while read prefix
do
	awk '{print "chr" $0}' ${WORKING_DIR}/${prefix}/${prefix}_peaks.broadPeak > ${WORKING_DIR}/${prefix}/${prefix}_homer.broadPeak

done < ${input_filelist}


exit
