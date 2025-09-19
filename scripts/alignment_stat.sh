#!/bin/bash

# Define input and target directories
INPUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0030_alignment"
TARGET_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0040_alignment_stat"
mkdir -p ${TARGET_DIR}

# Define a file containing the prefix of input files
prefix_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/filename_prefix.txt"

# Run the calculate statistics
while read prefix
do	
	samtools flagstat ${INPUT_DIR}/${prefix}.sorted.dedupl.bam > ${TARGET_DIR}/${prefix}_flagstat.tsv

done < ${prefix_list}

exit
