#!/bin/bash

# =========================

# Alignment with bowtie2

# =========================

# Define pathway to the software
software_path="/usr/local/bin/TELEPITETT/bowtie2-2.5.4/"

# Define input and target directory
INPUT_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0020_trimming"
TARGET_DIR="/home/jw0rtd/omics_data_analysis/ChIP_analysis/0030_alignment"
mkdir -p ${TARGET_DIR}

# Define indexed reference genome
refgenome="/shared/omics_data_analysis/DATA/reference_genomes/canis_familiaris/bowtie2_index/Canis_lupus_familiaris.ROS_Cfam_1.0"

# Define list file containing the prefixes of fastq files
prefix_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/filename_prefix.txt"

# Execute the alignment
while read prefix
do
	echo "Actual sample: ${prefix}; Date: $(date)"
	
	# 1) Alignment
	echo "Starting alignment... "
	${software_path}/bowtie2 --threads 4 --very-sensitive -x ${refgenome} -1 ${INPUT_DIR}/${prefix}_R1_trim.fastq.gz -2 ${INPUT_DIR}/${prefix}_R2_trim.fastq.gz -S ${TARGET_DIR}/${prefix}.sam > ${TARGET_DIR}/${prefix}.log 2> ${TARGET_DIR}/${prefix}.err

	# 2) Sorting
	echo "Sorting..."
	samtools sort -@ 2 ${TARGET_DIR}/${prefix}.sam -O bam -o ${TARGET_DIR}/${prefix}.sorted.bam
	rm ${TARGET_DIR}/${prefix}.sam # removing SAM file

	# 3) Indexing
	#echo "Indexing..."
	#samtools index ${TARGET_DIR}/${prefix}.sorted.bam -b -o ${TARGET_DIR}/${prefix}.sorted.bam.bai

	# 4) Mark duplicates
	echo "Marking duplicates with indexing..."
	java -jar ${PICARDENV} MarkDuplicates INPUT=${TARGET_DIR}/${prefix}.sorted.bam OUTPUT=${TARGET_DIR}/${prefix}.sorted.dedupl.bam METRICS_FILE=${TARGET_DIR}/${prefix}.deduplmetrics.txt CREATE_INDEX=true
	rm ${TARGET_DIR}/${prefix}.sorted.bam # remove sorted bam file

	echo "Ending... Date: $(date)"

done < ${prefix_list}


