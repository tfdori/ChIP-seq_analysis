#!/bin/bash

# Define input directories
SPEC_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks"
SHARED_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/overlapPeaks"

# Define reference genome
ROS_Cfam="/shared/omics_data_analysis/DATA/reference_genomes/canis_familiaris/GENOME/Canis_lupus_familiaris.ROS_Cfam_1.0.dna.toplevel.fa"

# Create preparsed directory for homer
PREPARSED_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0060_motifsearch/preparsed_homer"
mkdir -p ${PREPARSED_DIR}

# ------------------------------------------
# 1) Search motifs in tissue specific peaks
# ------------------------------------------

# Define output directory
OUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0060_motifsearch/specMotifs"
mkdir -p ${OUT_DIR}

# Cerebrum
mkdir -p ${OUT_DIR}/cerebrum
findMotifsGenome.pl ${SPEC_DIR}/cerebrum_specific.broadPeak ${ROS_Cfam} ${OUT_DIR}/cerebrum -preparsedDir ${PREPARSED_DIR} 2> ${OUT_DIR}/cerebrum/cerebrum_motifs.err

# Liver
mkdir -p ${OUT_DIR}/liver
findMotifsGenome.pl ${SPEC_DIR}/liver_specific.broadPeak ${ROS_Cfam} ${OUT_DIR}/liver -preparsedDir ${PREPARSED_DIR} 2> ${OUT_DIR}/liver/liver_motifs.err

# Pancreas
mkdir -p ${OUT_DIR}/pancreas
findMotifsGenome.pl ${SPEC_DIR}/pancreas_specific.broadPeak ${ROS_Cfam} ${OUT_DIR}/pancreas -preparsedDir ${PREPARSED_DIR} 2> ${OUT_DIR}/pancreas/pancreas_motifs.err

# Kidney
mkdir -p ${OUT_DIR}/kidney
findMotifsGenome.pl ${SPEC_DIR}/kidney_specific.broadPeak ${ROS_Cfam} ${OUT_DIR}/kidney -preparsedDir ${PREPARSED_DIR} 2> ${OUT_DIR}/kidney/kidney_motifs.err

# ---------------------------------
# 2) Search motifs in shared peaks
# ---------------------------------

# Define output directory
OUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0060_motifsearch/sharedMotifs"
mkdir -p ${OUT_DIR}

findMotifsGenome.pl ${SHARED_DIR}/tissues_shared_peaks.broadPeak ${ROS_Cfam} ${OUT_DIR}/ -preparsedDir ${PREPARSED_DIR} 2> ${OUT_DIR}/shared_peaks.err


exit
