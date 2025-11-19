#!/bin/bash

# ------------------
# 1. Within tissues
# ------------------

# Define file list
input_filelist="/home/jw0rtd/omics_data_analysis/ChIP_analysis/peak_filelist_intersect.txt"

# Define the working directory
WORK_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling"
mkdir -p ${WORK_DIR}/overlapPeaks

# Check the shared peaks within tissues
while read -r tissue inputfile1 inputfile2
do
	# Extract coordinates of overlap
	bedtools intersect -a ${WORK_DIR}/${inputfile1}/${inputfile1}_homer.broadPeak -b ${WORK_DIR}/${inputfile2}/${inputfile2}_homer.broadPeak -u > ${WORK_DIR}/overlapPeaks/${tissue}_shared_peaks.broadPeak

done < ${input_filelist}

# -------------------
# 2. Between tissues 
# -------------------

WORK_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/overlapPeaks"

# Execute the tissue comparison
bedtools intersect -a ${WORK_DIR}/liver_shared_peaks.broadPeak -b ${WORK_DIR}/kidney_shared_peaks.broadPeak -u | bedtools intersect -a - -b ${WORK_DIR}/pancreas_shared_peaks.broadPeak -u | bedtools intersect -a - -b ${WORK_DIR}/cerebrum_shared_peaks.broadPeak -u > ${WORK_DIR}/tissues_shared_peaks.broadPeak


# -------------------------
# 3. Tissue specific peaks
# -------------------------

mkdir -p /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks

bedtools intersect -a ${WORK_DIR}/cerebrum_shared_peaks.broadPeak -b ${WORK_DIR}/liver_shared_peaks.broadPeak ${WORK_DIR}/kidney_shared_peaks.broadPeak ${WORK_DIR}/pancreas_shared_peaks.broadPeak -v > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks/cerebrum_specific.broadPeak

bedtools intersect -a ${WORK_DIR}/kidney_shared_peaks.broadPeak -b ${WORK_DIR}/pancreas_shared_peaks.broadPeak ${WORK_DIR}/liver_shared_peaks.broadPeak ${WORK_DIR}/cerebrum_shared_peaks.broadPeak -v > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks/kidney_specific.broadPeak

bedtools intersect -a ${WORK_DIR}/pancreas_shared_peaks.broadPeak -b ${WORK_DIR}/cerebrum_shared_peaks.broadPeak ${WORK_DIR}/kidney_shared_peaks.broadPeak ${WORK_DIR}/liver_shared_peaks.broadPeak -v > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks/pancreas_specific.broadPeak

bedtools intersect -a ${WORK_DIR}/liver_shared_peaks.broadPeak -b ${WORK_DIR}/cerebrum_shared_peaks.broadPeak ${WORK_DIR}/kidney_shared_peaks.broadPeak ${WORK_DIR}/pancreas_shared_peaks.broadPeak -v > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks/liver_specific.broadPeak


exit
