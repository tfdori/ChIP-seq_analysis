# ChIP-seq_analysis

## About the analysis
I performed tissue-specific H3K27ac analysis on downloaded ChIP-seq data. This project was part of my university studies, so it is NOT a real research work with published results! The ChIP-seq data came  from four different tissues (cerebrum, kidney, liver, pancreas) of  adult Beagle dogs. H3K27ac modifications are epigenetic marks, that have an influence on chromatin structure and accessibility, thus indicate active promoters and enhancers.

## Availability of ChIP-seq data
The ChIP-seq data is available [here](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE203104).

## Workflow
0. Download raw data ([SRA toolkit](https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit))
1. Quality control of raw data ([FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/))
2. Trimming ([ShortRead](https://bioconductor.org/packages/release/bioc/html/ShortRead.html))
3. Quality control of trimmed data (FastQC)
4. Alignment ([Bowtie2](https://pubmed.ncbi.nlm.nih.gov/22388286/))
5. Sorting, removing duplicates ([samtools](https://academic.oup.com/gigascience/article/10/2/giab008/6137722), [Picard](http://broadinstitute.github.io/picard/))
6. Calculate alignment statistics (samtools)
7. Peak calling, filtering ([macs2](https://github.com/macs3-project/MACS), [bedtools](https://pubmed.ncbi.nlm.nih.gov/25199790/))
8. Motif discovery ([HOMER](https://pubmed.ncbi.nlm.nih.gov/20513432/))
9. Identify the most enriched motifs
10. Identify the affected genes (bedtools)
11. Gene ontology ([PantherDB](https://pubmed.ncbi.nlm.nih.gov/12520017/))

## Folders and files

### Report file
*ChIPseq_JEK.sh* <br>
  Contains the report and the workflow of the analysis.
  The file paths correspond to my local computer. The scripts and input list files are available in the Scripts and ListFiles folders.

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

  
### List files
  "list_files" folder provide input files for scripts:
  - *dirlist_FE.txt*
  - *filename_prefix.txt*
  - *filename_trim.txt*
  - *peak_filelist_annotate.txt*
  - *peak_filelist_intersect.txt*
  - *peak_filelist_test.txt*
  - *prefix_peakcall.tsv*

Some files are not uploaded here:
- reference genome ([ROS_Cfam_1.0](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_014441545.1/))
- genome annotation
  
