# The microbiome of the buffalo digestive tract

## Introduction

This REPO contains in-house scripts (R, Python), data and detailed instructions for users to reproduce much of the analyses we have done for our manuscript titled "[The microbiome of the buffalo digestive tract](https://doi.org/10.1038/s41467-022-28402-9)".

If further assisstance is required, please do not hesitate to contact me by raise an issue in the "Issues" section of this REPO.

## PREREQUISITES

Below are a list of softwares and databases required before running out test data. Most of the softwares can be installed through [CONDA](https://www.anaconda.com/products/individual).

### Softwares

A list of required softwares and URLs for their downloads. Please follow instructions for proper software installation on their respective servers. The versions in the parenthesis indicate the ones we used for our project.

|Software|Availability|
|:--------|:-----------|
|Trimmomatic (v.0.35)|http://www.usadellab.org/cms/index.php?page=trimmomatic|
|Bowtie2 (v.2.3.3)|http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml|
|MEGAHIT (v.1.2.8)|https://github.com/voutcn/megahit|
|metaSPAdes (v.3.13.0)|https://github.com/ablab/spades|
|MetaBAT2 (2.12.1)|https://bitbucket.org/berkeleylab/metabat/src/master/|
|dRep (v.2.3.2)|https://github.com/MrOlm/drep|
|CheckM (v.1.0.18)|https://github.com/Ecogenomics/CheckM|
|Mash (v.2.3)|https://github.com/marbl/mash|
|FastANI (v.1.32)|https://github.com/ParBLiSS/FastANI|
|Prodigal (v.2.6.3)|https://github.com/hyattpd/Prodigal|
|bwa (v.0.7.15)|https://github.com/lh3/bwa|
|Samtools (v.1.8)|https://github.com/samtools/samtools|
|BEDTools (v.2.27.1)|https://bedtools.readthedocs.io/en/latest/content/installation.html|
|GTDB-TK (v.1.4.1)|https://github.com/Ecogenomics/GTDBTk|
|GraPhlAn (v.1.1.3)|https://github.com/biobakery/graphlan|
|CD-HIT (v.4.8.1)|https://github.com/weizhongli/cdhit/|
|eggnog-mapper (v.4.5)|https://github.com/eggnogdb/eggnog-mapper|
|hmmer (v.3.3.2)|https://github.com/EddyRivasLab/hmmer|

Note: Please make sure all the softwares are in your $PATH.

### Databases

A list of databases and their URLs for downloads:

|Database|Description|Availability|
|:--------|:-----------|:------------|
|Buffalo genomic|Host genome sequences|[CUSA SWP](https://bigd.big.ac.cn/gwh/Assembly/262/show) and [CUSA RVB](https://bigd.big.ac.cn/gwh/Assembly/261/show)|
|Glycine max|Host foodborne genome sequences|[Gmax ZH13 v2.0](https://bigd.big.ac.cn/gwh/Assembly/652/show)|
|Zea Mays|Host foodborne genome sequences|[B73](https://www.ncbi.nlm.nih.gov/nuccore/LPUQ00000000)|
|Medicago truncatula|Host foodborne genome sequences|[MtrunA17r5.0-ANR](https://www.ncbi.nlm.nih.gov/assembly/GCF_003473485.1/)|
|EggNOG|EggNOG annotation|http://eggnog5.embl.de/#/app/downloads|
|dbCAN|CAZymes annotation|http://bcb.unl.edu/dbCAN2/download/|
|GTDB-tk|GTDB-tk database|https://gtdb.ecogenomic.org/downloads|

Note: Please note the versions indicate the ones we used for our project, which might not be the latest.

## USAGE

The Example workflow is divided into two folders: 'Pipeline' and 'Scripts'. 'Pipeline' folder contains details for the public softwares and their parameters used for our project, while the 'Scripts' folder contains in-house scripts for further data analysis and visualisation. See below for more information.

### Generation of metagenomic-assembled genomes (MAGs) and their taxonomic and functional annotation

#### Part1: 01_preprocessing.sh

Pre-processing of the raw sequencing data in FASTQ format, including quality control (removal of low-quality and adaptor sequences) and removal of host genome and contaminations from food.

#### Part2: 02_assembly-binning.sh

Metagenomic assembly and binning were divided into individual assembly of each sample and co-assembly of all samples; in the co-assembly step, samples may be divided into different groups according to the origins (e.g., body sites) of the samples. The assembled contigs were then merged together for binning.

#### Part3: 03_MAGs_taxonomy.sh

High-quality bins were identified to obtain MAGs. The taxonomic annotation was then performed for all MAGs to determine their taxonomic identities and phylogenetic relationships.

#### Part4: 04_MAGs_function.sh

MAGs were subjected to tools including PRODIGAL to identify protein-coding and non-coding genes. Protein-coding genes were clustered using CD-HIT to gereate a non-redundant catelog, which were used as input to BLAST against serveral public databases for functional annotation.

### Statistical analysis and visualization

All analyzed data were loaded to R and python for further analysis and visualisation using serveral in-house scripts. The in-house scripts are available in the folder 'Scripts'.

## Limitations

Note: This project is jointly participated by Feng Tong, Teng Wang and Na L. Gao.

Cite: Tong, F. et al. [The microbiome of the buffalo digestive tract](https://doi.org/10.1038/s41467-022-28402-9). Nature Communications 13, 1-16 (2022).

