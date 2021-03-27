#!/bin/bash
  

############## Part3 Taxonomic annotation for MAGs ###########################
drep=~/bin/drep
bins=./all_bins/
gtdbtk=~/bin/gtdbtk
### Step1: dereplication for all bins by drep

#note:before this step, all bins from megahit and metaSAPdes should be renamed unique name and moved into a single directory. Here directory named all_bins.

mkdir -p ./04_drep/
${drep} dereplicate ./04_drep/ \
	-p 40 \
	-comp 80 \
	-con 10 \
	-str 100 \
	-strW 0 \
	-g ${bins}*.fa

###Step2: MAGs classification by GTDB-TK

mkdir -p ./GTDB-TK/
gtdbtk classify_wf --genome_dir ./04_drep/dereplicated_genomes/ \
	-x fa \
	--out_dir ./GTDB-TK/ \
	--cpus 40


