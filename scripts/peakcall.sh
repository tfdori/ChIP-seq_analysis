#!/bin/bash

# Define input and output directories
INPUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0030_alignment"
TARGET_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling"
mkdir -p "${TARGET_DIR}"

# Define file containing the prefixes of treatment and control samples
prefix_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/prefix_peakcall.tsv"

# Grep the treatment and control samples and perform the peak calling
while read -r prefix_tr prefix_ctr
do
	# Creating an output directory for the actual sample
	mkdir -p ${TARGET_DIR}/${prefix_tr}
	
	# Peak calling
	macs2 callpeak -t ${INPUT_DIR}/${prefix_tr}.sorted.dedupl.bam -c ${INPUT_DIR}/${prefix_ctr}.sorted.dedupl.bam -f BAM -g 1.9e9 --broad -n ${prefix_tr} --outdir ${TARGET_DIR}/${prefix_tr} > ${TARGET_DIR}/${prefix_tr}/${prefix_tr}.log 2> ${TARGET_DIR}/${prefix_tr}/${prefix_tr}.err
		# -g: -> effective genome size is established by ucsc-facount program
		# --broad -> broad peaks are also detected

done < ${prefix_list}


exit
