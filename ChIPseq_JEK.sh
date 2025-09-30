#!/bin/bash

# Name: Dora Tfirst
# Year of the analysis: 2025

# ============================================================

# Project: Tissue-specific analysis of H3K27ac ChIP-seq data in dog tissues

# Data: ChIP-seq from 4 tissues (liver, pancreas, kidney, cerebrum) and controls with no antibody

# Samples: 2 dog/tissue + 1 control/tissue -> 12 samples

# Illumina platforms: HiSeq and NovaSeq

# =============================================================

# Define working directory
WORK_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis"

# --------------------------
# 1. Download data from SRA
# --------------------------

mkdir /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data

# H3K27ac (Abcam, #ab8898): ~30 GB

# Pancreas:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225198 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225198.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225198.err &
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225199 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225199.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225199.err &

# Liver:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225122 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225122.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225122.err &
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225123 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225123.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225123.err &

# Kidney:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225124 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225124.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225124.err &
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225125 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225125.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225125.err &

# Cerebrum:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225152 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225152.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225152.err &
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225153 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225153.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225153.err &

# Controls:

# Pancreas:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225104 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225104.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225104.err &	
#nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225105 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225105.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225105.err &

# Liver:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225136 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225136.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225136.err &
#nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225137 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225137.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225137.err & 

# Kidney:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225138 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225138.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225138.err &
#nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225139 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225139.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225139.err &

# Cerebrum:
nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225142 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225142.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225142.err &
#nohup /usr/local/bin/TELEPITETT/SRAtoolkit/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump --split-files -O ${WORK_DIR}/0000_data -gzip SRR19225143 > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225143.log 2> /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data/SRR19225143.err &


# Creating symbolic links to make them more meaningful

# Pancreas
ln -s ${WORK_DIR}/0000_data/SRR19225198_1.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_SRR19225198_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225198_2.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_SRR19225198_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225199_1.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_SRR19225199_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225199_2.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_SRR19225199_R2.fastq.gz

# Liver
ln -s ${WORK_DIR}/0000_data/SRR19225122_1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225122_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225122_2.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225122_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225123_1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225123_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225123_2.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225123_R2.fastq.gz

# Kidney
ln -s ${WORK_DIR}/0000_data/SRR19225124_1.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_SRR19225124_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225124_2.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_SRR19225124_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225125_1.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_SRR19225125_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225125_2.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_SRR19225125_R2.fastq.gz

# Cerebrum
ln -s ${WORK_DIR}/0000_data/SRR19225152_1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225152_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225152_2.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225152_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225153_1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225153_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225153_2.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225153_R2.fastq.gz

# Controls
ln -s ${WORK_DIR}/0000_data/SRR19225104_1.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_control_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225104_2.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_control_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225136_1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_control_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225136_2.fastq.gz ${WORK_DIR}/0000_data/CF_liver_control_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225138_1.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_control_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225138_2.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_control_R2.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225142_1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_control_R1.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225142_2.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_control_R2.fastq.gz


# -------------------------------
# 2. Quality Control with FastQC
# -------------------------------

bash ${WORK_DIR}/scripts/quality_control.sh

# ------------
# 3. Trimming
# ------------

# Large differences in read length due to difference of sequencing methods.
# Some fastq files contains only 50 bp long reads, I do not trim them:
  # CF_pancreas_SRR19225198_R1.fastq.gz, CF_pancreas_SRR19225198_R2.fastq.gz, F_kidney_SRR19225125_R1.fastq.gz, F_kidney_SRR19225125_R2.fastq.gz, F_pancreas_control_R1.fastq.gz, F_pancreas_control_R2.fastq.gz

# Create directory for the output files
mkdir /home/jw0rtd/omics_data_analysis/ChIP_analysis/0030_trimming 

nohup bash ${WORK_DIR}/scripts/run_trimming.sh > ${WORK_DIR}/log_files/trimming.log 2> ${WORK_DIR}/log_files/trimming.err &

# Creating directory for log file
mkdir ${WORK_DIR}/log_files

# Remove raw data which has been trimmed
cd /home/jw0rtd/omics_data_analysis/ChIP_analysis/0000_data
# CF_pancreas_SRR19225199:
rm SRR19225199_1.fastq.gz SRR19225199_2.fastq.gz
# CF_liver_SRR19225122:
rm SRR19225122_1.fastq.gz SRR19225122_2.fastq.gz
# CF_liver_SRR19225123
rm SRR19225123_1.fastq.gz SRR19225123_2.fastq.gz
# CF_kidney_SRR19225124:
rm SRR19225124_1.fastq.gz SRR19225124_2.fastq.gz
# CF_cerebrum_SRR19225152:
rm SRR19225152_1.fastq.gz SRR19225152_2.fastq.gz
# CF_cerebrum_SRR19225153:
rm SRR19225153_1.fastq.gz SRR19225153_2.fastq.gz
# CF_liver_control:
rm SRR19225136_1.fastq.gz SRR19225136_2.fastq.gz
# CF_kidney_control:
rm SRR19225138_1.fastq.gz SRR19225138_2.fastq.gz
# CF_cerebrum_control:
rm SRR19225142_1.fastq.gz SRR19225142_2.fastq.gz

# unlink symbolic links
unlink CF_pancreas_SRR19225199_R1.fastq.gz
unlink CF_pancreas_SRR19225199_R2.fastq.gz
unlink CF_liver_SRR19225122_R1.fastq.gz
unlink CF_liver_SRR19225122_R2.fastq.gz
unlink CF_liver_SRR19225123_R1.fastq.gz
unlink CF_liver_SRR19225123_R2.fastq.gz
unlink CF_kidney_SRR19225124_R1.fastq.gz
unlink CF_kidney_SRR19225124_R2.fastq.gz
unlink CF_cerebrum_SRR19225152_R1.fastq.gz
unlink CF_cerebrum_SRR19225152_R2.fastq.gz
unlink CF_cerebrum_SRR19225153_R1.fastq.gz
unlink CF_cerebrum_SRR19225153_R2.fastq.gz
unlink CF_liver_control_R1.fastq.gz
unlink CF_liver_control_R2.fastq.gz
unlink CF_kidney_control_R1.fastq.gz
unlink CF_kidney_control_R2.fastq.gz
unlink CF_cerebrum_control_R1.fastq.gz
unlink CF_cerebrum_control_R2.fastq.gz


# ------------
# 4. QC again
# ------------

nohup bash ${WORK_DIR}/scripts/quality_control2.sh > ${WORK_DIR}/log_files/qc_trimmed.log 2> ${WORK_DIR}/log_files/qc_trimmed.err &

# --------------------------
# 5. Alignment with bowtie2
# --------------------------

# Creating symbolic link to the 0020_trimming directory for non-trimmed files
ln -s ${WORK_DIR}/0000_data/SRR19225104_1.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_control_R1_trim.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225104_2.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_control_R2_trim.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225125_1.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_SRR19225125_R1_trim.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225125_2.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_SRR19225125_R2_trim.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225198_1.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_SRR19225198_R1_trim.fastq.gz
ln -s ${WORK_DIR}/0000_data/SRR19225198_2.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_SRR19225198_R2_trim.fastq.gz

# Execute the alignment
nohup bash /home/jw0rtd/omics_data_analysis/ChIP_analysis/scripts/alignment_bowtie2.sh > ${WORK_DIR}/log_files/alignment_test.log 2> ${WORK_DIR}/log_files/alignment_test.err &


# ------------------------
# 6. Alignment statistics
# ------------------------

nohup bash ${WORK_DIR}/scripts/alignment_stat.sh > ${WORK_DIR}/log_files/flagstat_stat.log 2> ${WORK_DIR}/log_files/flagstat_stat.err &

# ----------------
# 7. Peak calling
# ----------------

nohup bash ${WORK_DIR}/scripts/peakcall.sh > ${WORK_DIR}/log_files/peackcall.log 2> ${WORK_DIR}/log_files/peackcall.err &

# -------------------------------------------
# 8. Filter shared and tissue-specific peaks
# -------------------------------------------

# Add "chr" to the BED files
bash ${WORK_DIR}/scripts/create_homer_input.sh

# Search for shared peaks within and between tissues, and tissue-specific peaks
bash ${WORK_DIR}/scripts/filter_peaks.sh

# Removing "chr" form bed files (not needed!)
SPEC_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/specPeaks"
SHARED_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0050_peakcalling/overlapPeaks"

sed -i 's/^chr//g' ${SPEC_DIR}/cerebrum_specific.broadPeak
sed -i 's/^chr//g' ${SPEC_DIR}/liver_specific.broadPeak 
sed -i 's/^chr//g' ${SPEC_DIR}/pancreas_specific.broadPeak
sed -i 's/^chr//g' ${SPEC_DIR}/kidney_specific.broadPeak
sed -i 's/^chr//g' ${SHARED_DIR}/cerebrum_shared_peaks.broadPeak
sed -i 's/^chr//g' ${SHARED_DIR}/kidney_shared_peaks.broadPeak
sed -i 's/^chr//g' ${SHARED_DIR}/liver_shared_peaks.broadPeak
sed -i 's/^chr//g' ${SHARED_DIR}/pancreas_shared_peaks.broadPeak
sed -i 's/^chr//g' ${SHARED_DIR}/tissues_shared_peaks.broadPeak


# -----------------
# 9. Motif search
# -----------------

# Motif search in tissue-specific and shared peaks
nohup bash ${WORK_DIR}/scripts/motif_search.sh > ${WORK_DIR}/log_files/motifsearch2.log 2> ${WORK_DIR}/log_files/motifsearch2.err &

# --------------------------------
# 10. Filter most enriched motifs
# --------------------------------

# 1) knownResults -> known TFs
# Add fold enrichment column and search for the most enriched motifs (FE>=2; q<0.05)
bash ${WORK_DIR}/scripts/knownResults_foldenrichment.sh

# 2) homerResults -> unknown TFs
# Add fold enrichment column and search for the most enriched motifs (FE>=2; no information about q value)
bash ${WORK_DIR}/scripts/homerResults_foldenrichment.sh

# -------------------
# 11. Affected genes
# -------------------

mkdir /home/jw0rtd/omics_data_analysis/ChIP_analysis/0070_peakannotate/

# Annotation file for the reference genome
annotation="/shared/omics_data_analysis/DATA/reference_genomes/canis_familiaris/ANNOTATION/Canis_lupus_familiaris.ROS_Cfam_1.0.113.gtf"

# Create a BED file from GTF file
grep -v "^#" ${annotation} | sed 's/;/\t/g' | sed 's/"//g' | sed 's/ /\t/g' | awk 'BEGIN {OFS="\t"} {if ($3 == "gene") {print $1, $4, $5, $10}}' > /home/jw0rtd/omics_data_analysis/ChIP_analysis/0070_peakannotate/Canis_lupus_familiaris.ROS_Cfam_1.0.annotation.bed

# Create file containing genes affected by peaks for gene ontology
bash ${WORK_DIR}/scripts/peakGenes.sh


# Finally I performed a GO analysis on PantherDB: https://pantherdb.org/


