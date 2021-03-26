# Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host

## Introduction

This directory contains scripts related to the manuscript "Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host".

Please install the required programs and download the necessary database before testing. Most of the software can be installed through [CONDA](https://www.anaconda.com/products/individual).

## INSTALLATION

Before starting the process, you need to create a new working path, and all sequencing rawdata links to the same directory.

### Software installation

The required software names (including versions) and addresses are as follows, see instructions for proper software installation on the server:

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

Note: Be sure that the software is loaded in the same environment, that some software uses will call others (say dreps), that the software version given is not necessarily the latest version, and that given here is the version used to complete the project.

### Database installation

The data names, instructions, and addresses that need to be downloaded in this project are as follows:

|Database|Description|Availability|
|:--------|:-----------|:------------|
|Buffalo genomic|Host genome sequences|[CUSA SWP](https://bigd.big.ac.cn/gwh/Assembly/262/show) and [CUSA RVB](https://bigd.big.ac.cn/gwh/Assembly/261/show)|
|Glycine max|Host foodborne genome sequences|[Gmax ZH13 v2.0](https://bigd.big.ac.cn/gwh/Assembly/652/show)|
|Zea Mays|Host foodborne genome sequences|[B73](https://www.ncbi.nlm.nih.gov/nuccore/LPUQ00000000)|
|Medicago truncatula|Host foodborne genome sequences|[MtrunA17r5.0-ANR](https://www.ncbi.nlm.nih.gov/assembly/GCF_003473485.1/)|
|EggNOG|EggNOG annotation|http://eggnog5.embl.de/#/app/downloads|
|dbCAN|CAZymes annotation|http://bcb.unl.edu/dbCAN2/download/|
|GTDB-tk|GTDB-tk database|https://gtdb.ecogenomic.org/downloads|

Note: The version are only the version used in the paper,most of database are constantly updated.

## Usage

## Limitations

This workflow is just a statement of work for project "Microbial ecology along the buffalo digestive tract provides insights to their functions and interactions with the host" and does not necessarily apply to other projects, as appropriate when other projects are being completed as the actual work needs.


