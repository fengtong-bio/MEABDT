#!/bin/bash


############## Part2 Assembly and binning ###########################
metaSPAdes=./metaSPAdes/metaspades.py
megahit=~/bin/megahit
bwa=~/bin/bwa
samtools=~/bin/samtools
metabat2=./metabat/runMetaBat.sh
###Step1: Assembly

#metaSPAdes
mkdir -p ./03_assembly_metaSPAdes/

python ${metaSPAdes} \
	--pe1-1 02_Removed_Host/${sampleID}_paired_clean1.fq \
	--pe1-2 02_Removed_Host/${sampleID}_paired_clean2.fq \
	--pe1-s 02_Removed_Host/${sampleID}_single_clean1.fq \
	--pe1-s 02_Removed_Host/${sampleID}_single_clean2.fq \
	-k 21,31,41,51,61,71,81,91,101,111,121,131,141 \
	-t 20 \
	-o 03_assembly_metaSPAdes/
#The k-mer with longest N50 and total reads length will be as the final result. 

#megahit
mkdir -p ./03_Assembly_megahit/

${megahit} -1 02_Removed_Host/${sampleID}_paired_clean1.fq \
	   -2 02_Removed_Host/${sampleID}_paired_clean2.fq \
	   -r 02_Removed_Host/${sampleID}_single_clean1.fq,02_Removed_Host/${sampleID}_single_clean2.fq \
	   -t 20 \
	   --min-contig-len 1000 \
	   -o 03_Assembly_megahit/${sampleID}


###Step2: Binning
mkdir -p ./binning/metaSPAdes/
mkdir -p ./binning/megahit/

#metaSPAdes
cd ./binning/metaSPAdes/
mkdir -p ./01bwa/
mkdir -p ./bwa_index/
mkdir -p ./02metabwa/
${bwa} index -a bwtsw 03_assembly_metaSPAdes/scaffolds.fasta -p ./bwa_index/${sampleID}.db

#paired
${bwa} mem -t 20 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_paired_clean1.fq \
	02_Removed_Host/${sampleID}_paired_clean2.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_paired.bam
#unpaired1
${bwa} mem -t 8 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_single_clean1.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_unpaired1.bam
#unpaired2
${bwa} mem -t 8 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_single_clean2.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_unpaired2.bam

#merge
${samtools} merge ./01bwa/${sampleID}_merged_sorted.bam \
	./01bwa/${sampleID}_sorted_paired.bam \
	./01bwa/${sampleID}_sorted_unpaired1.bam \
	./01bwa/${sampleID}_sorted_unpaired2.bam

#metabat2
cd ./02metabwa/
${metabat2} 03_assembly_metaSPAdes/scaffolds.fasta \
	../01bwa/${sampleID}_merged_sorted.bam \
	-t 20
cd ../
cd ../../
#megahit
cd ./binning/megahit/
mkdir -p ./01bwa/
mkdir -p ./bwa_index/
mkdir -p ./02metabwa/
${bwa} index -a bwtsw 03_Assembly_megahit/final.contigs.fa -p ./bwa_index/${sampleID}.db

#paired
${bwa} mem -t 20 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_paired_clean1.fq \
	02_Removed_Host/${sampleID}_paired_clean2.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_paired.bam
#unpaired1
${bwa} mem -t 8 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_single_clean1.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_unpaired1.bam
#unpaired2
${bwa} mem -t 8 -a ./bwa_index/${sampleID}.db \
	02_Removed_Host/${sampleID}_single_clean2.fq \
	| ${samtools} sort -o ./01bwa/${sampleID}_sorted_unpaired2.bam

#merge
${samtools} merge ./01bwa/${sampleID}_merged_sorted.bam \
	./01bwa/${sampleID}_sorted_paired.bam \
	./01bwa/${sampleID}_sorted_unpaired1.bam \
	./01bwa/${sampleID}_sorted_unpaired2.bam

#metabat2
cd ./02metabwa/
${metabat2} 03_Assembly_megahit/final.contigs.fa \
	        ../01bwa/${sampleID}_merged_sorted.bam \ 
		        -t 20
cd ../
cd ../../



