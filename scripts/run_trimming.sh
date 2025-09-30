#!/usr/bash

# Define working directory
WORK_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis"

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_pancreas_SRR19225199_R1.fastq.gz ${WORK_DIR}/0000_data/CF_pancreas_SRR19225199_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_SRR19225199_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_pancreas_SRR19225199_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_liver_SRR19225122_R1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225122_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_SRR19225122_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_SRR19225122_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_liver_SRR19225123_R1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_SRR19225123_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_SRR19225123_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_SRR19225123_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_kidney_SRR19225124_R1.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_SRR19225124_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_SRR19225124_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_SRR19225124_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225152_R1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225152_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_SRR19225152_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_SRR19225152_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225153_R1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_SRR19225153_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_SRR19225153_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_SRR19225153_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_liver_control_R1.fastq.gz ${WORK_DIR}/0000_data/CF_liver_control_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_control_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_liver_control_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_kidney_control_R1.fastq.gz ${WORK_DIR}/0000_data/CF_kidney_control_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_control_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_kidney_control_R2_trim.fastq.gz && \

Rscript ${WORK_DIR}/scripts/trimming_process.R ${WORK_DIR}/0000_data/CF_cerebrum_control_R1.fastq.gz ${WORK_DIR}/0000_data/CF_cerebrum_control_R2.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_control_R1_trim.fastq.gz ${WORK_DIR}/0020_trimming/CF_cerebrum_control_R2_trim.fastq.gz



exit


