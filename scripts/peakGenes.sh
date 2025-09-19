#!/bin/bash


# Define directories
OUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0070_peakannotate"
IN_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks"

# Define annotation bed file
annotation_bed="${OUT_DIR}/Canis_lupus_familiaris.ROS_Cfam_1.0.annotation.bed"

# Define the input files in a list file
inputfile_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/peak_filelist_annotate.txt"

# 1) Specific peaks
# For each tissue check the overlapped genes
while read inputfile tissue
do

	# IntersectBed with annotation (gene list)
	bedtools intersect -a ${annotation_bed} -b ${IN_DIR}/${inputfile} -wa | cut -f 4 | sort | uniq > ${OUT_DIR}/${tissue}_genes.bed


done < ${inputfile_list}

# 2) Shared peaks
bedtools intersect -a ${annotation_bed} -b /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/overlapPeaks/tissues_shared_peaks.broadPeak -wa | cut -f 4 | sort | uniq > ${OUT_DIR}/shared_genes.bed 



