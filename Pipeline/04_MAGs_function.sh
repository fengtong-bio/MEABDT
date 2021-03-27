#!/bin/bash

############## Part4 Functional annotation for MAGs ###########################
prodigal=~/bin/prodigal
MAGs=./04_drep/dereplicated_genomes/
cdhit=~/bin/cd-hit
eggnog=./eggNOG-mapper/emapper.py
eggnog_db=./eggNOG-mapper/data/eggnog.db
dbcan2=./dbCAN2/Tools/run_dbcan/run_dbcan.py
dbcan2_db=./dbCAN2/Tools/run_dbcan/db/

###Step1: protein prediction by Prodigal

mkdir -p ./prodigal/

${prodigal} -i ${MAGs}/${MAGsID}.fa \
	-o prodigal/${MAGsID}.gff \
	-a prodigal/${MAGsID}.faa \
	-d prodigal/${MAGsID}.fna

###Step2: cluster all proteins by CD-HIT

mkdir -p ./cdhit/
#merge all proteins
cat ./prodigal/*.faa > ./cdhit/proteins.fa
${cdhit} -i ./cdhit/proteins.fa -o ./cdhit/proteins95 -c 0.95 -n 5 -M 16000 -d 0 -T 8


###Step3: COG annotation by eggNOG-mapper

mkdir ./eggnog/
cd ./eggnog/
#change the format of sequence
python ../../Scripts/format_fasta_1line.py ../cdhit/proteins95 ./proteins1line.fa
#split file
split -l 50000 -a 4 -d ./proteins1line.fa ./proteins1line.chunk_
#parallel processing
time parallel -j 4 --xapply \
	  'python ${eggnog} -m diamond --no_annot --no_file_comments --cpu 10 -i {1} -o {1}' \
	   ::: proteins1line.chunk_*
#merge all results
cat *.chunk_*.emapper.seed_orthologs > proteins.emapper.seed_orthologs
cp ${eggnog_db} /dev/shm

python ${eggnog} -annotate_hits_table proteins.emapper.seed_orthologs \
	--no_file_comments \
	-o eggnog_output \
	--cpu 40 \
	--data_dir /dev/shm \
	--override
cd ../
###Step4: CAZy annotation by dbCAN2

mkdir -p ./dbCAN2/
python ${dbcan2} ./cdhit/proteins95 protein \
	--out_dir ./dbCAN2/ \
	--db_dir -t diamond \
	--dia_cpu 10


