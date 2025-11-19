#!/bin/bash

# Define input directories
input_dir_list="/home/jw0rtd/omics_data_analysis/ChIP_analysis/dirlist_FE.txt"


while read INPUT_DIR
do
	
	# Adding a new column, the fold enrichment to the knownResults.txt file
	sed '1d' ${INPUT_DIR}/knownResults.txt | sed 's/%//g' | awk 'BEGIN {FS="\t"; print "Motif_Name" "\t" "Consensus" "P-value" "\t" "Log_P-value" "\t" "q-value_(Benjamini)" "\t" "#_of_Target_Sequences_with_Motif(of_936)" "\t" "%_of_Target_Sequences_with_Motif" "\t" "#_of_Background_Sequences_with_Motif(of_48726)" "\t" "%_of_Background_Sequences_with_Motif" "\t" "Fold_enrichment"} { if ($9 > 0) {fold_enrichment=$7/$9} else {fold_enrichment="NA"}; print $0 "\t" fold_enrichment}' > ${INPUT_DIR}/knownResults_FE.txt


	# Filter motifs having FE >= 2 and q < 0.05
	awk 'BEGIN {FS="\t"} {if ($10 >= 2 && $10 != "NA" && $4 < 0.05) {print $0}}' ${INPUT_DIR}/knownResults_FE.txt > ${INPUT_DIR}/knownResults_mostEnriched.tsv

done < ${input_dir_list}


exit
