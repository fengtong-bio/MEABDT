# Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host

## Introduction

This REPO contains in-house scripts (R, Python), data and detailed instructions for users to reproduce much of the analyses we have done for our manuscript titled "Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host".

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

### Mags acquisition and annotation

#### Part1: 01_preprocessing.sh

Pretreatment of rawdata, including quality control (removal of low-quality sequence and adaptor sequence) and removal of host genome (including host genome sequence and host foodborne genome sequence).

#### Part2: 02_assembly-binning.sh

Metagenomic assembly and binning were divided into individual assembly of each sample and co assembly of each group. The results of each assembly were binning.

#### Part3: 03_MAGs_taxonomy.sh

All the obtained Bins were filtered and de redundant to obtain high quality MAGs. Then the obtained MAGs were classified and annotated.

#### Part4: 04_MAGs_function.sh

The predicted results were analyzed according to the MAGs. Non-redundant genes were annotated by function and enzyme.

### Statistical analysis and visualization

The quality of mags and the comparison rate of reads were analyzed. The self written scripts and visual instructions used in the inter group difference analysis of function annotation and enzyme annotation are in the folder 'Scripts'.

## Limitations

This workflow is just a statement of work for project "Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host" and does not necessarily apply to other projects, as appropriate when other projects are being completed as the actual work needs.


Note: This project is jointly participated by Feng Tong, Teng Wang and Na L. Gao.


