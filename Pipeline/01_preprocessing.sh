#!/bin/bash


############## Part1 QC: Quality control ###########################
Trimmomatic=~/bin/trimmomatic-0.35.jar
adapters=./TruSeq2-PE.fa
bowtie2=~/bin/bowtie2
bowtie2_build=~/bin/bowtie2-build
Ref=./Ref/contamination_ref.fa
Rawdata=./00_RawData


### Step1: Remove adapter and low quality sequence by trimmomatic
mkdir -p ./01_CleanData/

java -jar ${Trimmomatic} PE -threads 10 \
	-trimlog ${CleanData}/${sampleID}.logfile \
	${Rawdata}/${sampleID}_R1.fq.gz \
	${Rawdata}/${sampleID}_R2.fq.gz \
	01_CleanData/${sampleID}_clean_R1.fq \
	01_CleanData/${sampleID}_clean_unpaired_R1.fq \
	01_CleanData/${sampleID}_clean_R2.fq \
	01_CleanData/${sampleID}_clean_unpaired_R2.fq \
	ILLUMINACLIP:${adapters}:2:30:10  SLIDINGWINDOW:15:30 MINLEN:110 TRAILING:30 AVGQUAL:30

### Step2: Remove host and food sequence
mkdir -p ./02_Removed_Host/
#index of reference genome
${bowtie2_build} ${Ref} ./Ref/contamination_ref.db

#paired
${bowtie2} -x ./Ref/contamination_ref.db --very-sensitive -p 20 \
	-1 01_CleanData/${sampleID}_clean_R1.fq \
	-2 01_CleanData/${sampleID}_clean_R2.fq \
	--un-conc 02_Removed_Host/${sampleID}_paired_clean%.fq \
	--al-conc 02_Removed_Host/${sampleID}_paired_contam%.fq

#unpaired1
${bowtie2} -x ./Ref/contamination_ref.db --very-sensitive -p 8 \
	-U 01_CleanData/${sampleID}_clean_unpaired_R1.fq \
	--un 02_Removed_Host/${sampleID}_single_clean1.fq \
	--al 02_Removed_Host/${sampleID}_single_contam1.fq

#unpaired2
${bowtie2} -x ./Ref/contamination_ref.db --very-sensitive -p 8 \
	-U 01_CleanData/${sampleID}_clean_unpaired_R2.fq \
	--un 02_Removed_Host/${sampleID}_single_clean2.fq \
	--al 02_Removed_Host/${sampleID}_single_contam2.fq


