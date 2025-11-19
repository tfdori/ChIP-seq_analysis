#!/usr/bin/Rscript

# Define the absolute pathway to the R package
.libPaths("/usr/local/lib/R/site-library")
library("ShortRead")


# Add input arguments (files) to variables
ARGS <- commandArgs(trailingOnly=T)
input_fastq_R1 <- ARGS[1]
input_fastq_R2 <- ARGS[2]
output_fastq_R1 <- ARGS[3]
output_fastq_R2 <- ARGS[4]

# Read fastq files
fq_1 <- readFastq(input_fastq_R1)
fq_2 <- readFastq(input_fastq_R2)

# Trim the reads to 50 bp long
fq_1_trimmed <- narrow(fq_1, start = 1, end = 50)
fq_2_trimmed <- narrow(fq_2, start = 1, end = 50)

# Create output files
writeFastq(fq_1_trimmed, output_fastq_R1, compress = TRUE)
writeFastq(fq_2_trimmed, output_fastq_R2, compress = TRUE)

