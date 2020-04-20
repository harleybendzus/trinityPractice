#! /bin/bash

#***************************** PART I (4a) *****************************

#Downloading fastq files
fastq-dump --gzip --split-files SRR11284036 &

#Checking raw read quaity using fastqc
/opt/FastQC/fastqc SRR11284036_1.fastq.gz
/opt/FastQC/fastqc SRR11284036_2.fastq.gz

#Cleaning reas with trimmomatic
java -jar /opt/Trimmomatic-0.38/trimmomatic \
	PE \
	-phred33 \
	-threads 6 \
	SRR11284036_1.fastq.gz \
	SRR11284036_2.fastq.gz \
	clean_1.fastq.gz \
	unp_1.fastq.gz \
	clean_2.fastq.gz \
	unp_2.fastq.gz \
	ILLUMINACLIP:/opt/Trimmomatic-0.38/adapters/allAdapter.fas:2:30:10 \
	LEADING:30 \
	TRAILING:30 \
	HEADCROP:5 \
	SLIDINGWINDOW:5:30 \
	MINLEN:50

#Checking clean reads quality using fastqc
/opt/FastQC/fastqc clean_1.fastq.gz
/opt/FastQC/fastqc clean_2.fastq.gz

#Assembling transcripts using Trinity
/opt/trinity/Trinity --seqType fq --max_memory 50G --left clean_1.fastq.gz --right clean_2.fastq.gz --CPU 12 --SS_lib_type RF &

#***************************** PART II (4b) *****************************

#Annotating assesmbled transcripts using TransDecoder
/opt/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t Trinity.fasta

#Running blast query to check reads in SwissProt
blastp -query longest_orfs.pep -db /data/swissProt/uniprot_sprot.fasta -outfmt 6 -max_target_seqs 1 -num_threads 10 -evalue 1e-5 > trans.blast.tab
