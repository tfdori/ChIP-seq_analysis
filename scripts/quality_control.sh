#!/usr/bin/bash

# Define target and input directory
TARGET_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0010_QC"
mkdir -p ${TARGET_DIR}

INPUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data"

# Define the file containin the input filename's prefix
prefix_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/filename_prefix.txt"

# Execute the quality control on each sample
while read prefix
do
	fastqc -t 1 -o ${TARGET_DIR} ${INPUT_DIR}/${prefix}_R1.fastq.gz
	fastqc -t 1 -o ${TARGET_DIR} ${INPUT_DIR}/${prefix}_R2.fastq.gz

done < ${prefix_list}
