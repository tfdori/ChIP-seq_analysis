#!/bin/bash

# Define input directories
input_dir_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/dirlist_FE.txt"


while read INPUT_DIR
do
	# Adding header line (lines starts with ">") to homerMotifs.all.motifs file
	awk 'BEGIN {OFS="\t"; print "Consensus", "Motif_name", "Log odds_detection_threshold", "log_P-value", "only_0", "Occurence", "Motif_statistics"} /^>/ {print $0}' ${INPUT_DIR}/homerMotifs.all.motifs > ${INPUT_DIR}/homerResults.txt

	# Adding a new column, the fold enrichment
	awk 'BEGIN {
		FS="\t"
		OFS="\t"
		print "Motif_Name", "Consensus", "Motif_name", "Log odds_detection_threshold", "log_P-value", "only_0", "Occurence", "Motif_statistics", "Fold_enrichment"
	} {
		field = $6
		split(field, parts, ",")
		match(parts[1], /\(([0-9.]+)%\)/, a)
		target_pct = a[1]
		match(parts[2], /\(([0-9.]+)%\)/, b)
		background_pct = b[1]

		if (background_pct != 0) {
			fold_enrichment=target_pct/background_pct
			print $0, fold_enrichment
		} else {	
			print $0, "NA"
		}

	}' ${INPUT_DIR}/homerResults.txt > ${INPUT_DIR}/homerResults_FE.txt 


	# Filter motifs having FE >= 2
	awk 'BEGIN {FS="\t"} {if ($8 >= 2 && $8 != "NA") {print $0}}' ${INPUT_DIR}/homerResults_FE.txt > ${INPUT_DIR}/homerResults_mostEnriched.tsv

done < ${input_dir_list}



exit
