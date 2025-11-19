# ChIP-seq_analysis

## About the Analysis
I performed a tissue-specific H3K27ac analysis on downloaded ChIP-seq data. This project was part of my university studies, so it is NOT a real research work and does not include published results. The ChIP-seq data are derived from four tissues (cerebrum, kidney, liver, pancreas) of  adult Beagle dogs. The H3K27ac modification is an epigenetic mark that influences the chromatin structure and accessibility, indicating active promoters and enhancers.

## Availability of ChIP-seq Data
The ChIP-seq data is available on [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE203104).

## Workflow and Required Software
0. Download raw data ([SRA toolkit](https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit))
1. Quality control of raw data ([FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/))
2. Trimming (R language, [ShortRead](https://bioconductor.org/packages/release/bioc/html/ShortRead.html))
3. Quality control of trimmed data (FastQC)
4. Alignment ([Bowtie2](https://pubmed.ncbi.nlm.nih.gov/22388286/))
5. Sorting, removing duplicates ([samtools](https://academic.oup.com/gigascience/article/10/2/giab008/6137722), [Picard](http://broadinstitute.github.io/picard/))
6. Calculate alignment statistics (samtools)
7. Peak calling, filtering ([macs2](https://github.com/macs3-project/MACS), [bedtools](https://pubmed.ncbi.nlm.nih.gov/25199790/))
8. Motif discovery ([HOMER](https://pubmed.ncbi.nlm.nih.gov/20513432/))
9. Identify the most enriched motifs
10. Identify the affected genes (bedtools)
11. Gene ontology ([PantherDB](https://pubmed.ncbi.nlm.nih.gov/12520017/))

The effective genome size was calculated using [faCount](https://anaconda.org/bioconda/ucsc-facount).

The peaks were visually checked with [IGV](https://igv.org/).

## Attention
The project is memory-, disk- and CPU intensive.

## Folders and Files

### Report File
*ChIPseq_JEK.sh* <br>
  Contains the main report and the workflow.
  The file paths correspond to my local computer. The scripts and input list files are available in the scripts and list_files folders.

### Scripts
  "scripts" folder contains the scripts I ran:
  - *quality_control.sh*
  - *quality_control2.sh*
  - *run_trimming.sh*
  - *trimming_process.sh*
  - *alignment_bowtie2.sh*
  - *alignment_stat.sh*
  - *peakcall.sh*
  - *create_homer_input.sh*
  - *filter_peaks.sh*
  - *motif_search.sh*
  - *knownResults_foldenrichment.sh*
  - *homerResults_foldenrichment.sh*
  - *peakGenes.sh*

  
### List Files
  "list_files" folder provide input files for scripts:
  - *dirlist_FE.txt*
  - *filename_prefix.txt*
  - *filename_trim.txt*
  - *peak_filelist_annotate.txt*
  - *peak_filelist_intersect.txt*
  - *peak_filelist_test.txt*
  - *prefix_peakcall.tsv*

Some files are not uploaded:
- reference genome ([ROS_Cfam_1.0](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_014441545.1/))
- genome annotation
  
