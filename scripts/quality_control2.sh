#!/usr/bin/bash

# Define target and input directory
TARGET_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0011_QC"
mkdir -p ${TARGET_DIR}

INPUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0020_trimming"

# Define the file containin the input filename's prefix
file_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/filename_trim.txt"

# Execute the quality control on each sample
while read trimmed_file
do
	fastqc -t 1 -o ${TARGET_DIR} ${INPUT_DIR}/${trimmed_file}

done < ${file_list}
