# Homework 4

## assembleTranscipts.sh is a bash script that:

1. Downloads fastq files of reads from a mouse liver 
2. Checks the raw read quality with fastqc
3. Uses Trimmomatic to clean the reads
4. Checks the clean reads quality with fastqc
5. Uses Trinity to assemble transcripts of the reads
6. Identifies open reading frames (ORFs) in the trinity assembly using TransDecoder
7. Blasts the ORFs against the SwissProt database using the parameters described in the trinity annotation

# Part I (4a):

## Scripts: 

### Trim.sh
`- This is a bash script that runs the Trimmomatic program.

## Files & Directories:

### SRR11284036_1.fastq.gz
`- This is the gunzipped forward sequence of the mouse liver from SRA NCBI.

### SRR11284036_2.fastq.gz
`- This is the gunzipped reverse sequence of the mouse liver from SRA NCBI

### clean_1.fastq.gz & clean_2.fastq.gz
`- These are files that store ouput for clean forward(1) and reverse(2) reads. 

### unp_1.fastq.gz & unp_2.fastq.gz
`- These are files that store errored output for forward(1) and reverse(2) reads there were unable to be cleaned

### SRR11284036_1.fastq.html
`- This is the FastQC output of the clean, trimmed-forward reads.

### SRR11284036_2.fastq.html
`- This is the FastQC output of the clean, trimmed-reverse reads.

### Trinity.fasta.transdecoder_dir
`- This directory contains Trinnity's output files.

>### Trinity.fasta
>`- This file contains the assembled transcipts created by Trinity. 

### Trinity.fasta.transdecoder_dir.__checkpoints_longorfs
`- This directory contains TransDecoder's output files. 

>### longest_orfs.cds
>`- This file contains the protein coding genes created by TransDecoder.

>### longest_orfs.pep
>`- This file contains the translated amino acids created by TransDecoder.

# Part 2 (4b):

## Trinity
`- Number of trinity transcripts: 16326

## Trandecoder 
`- Number of ORFs detected: 7509 
`- Number of complete ORFs: 5067 
`- Number of  5’ partial ORFS: 1838 
`- Number of  3’ partial ORFS: 649 
`- Number of internal ORFS: 3803 

## Blast output
`- Number of unique ORFs annotated: 293 
`- Number of unique annotations: 3426 
`-  Name and number of most common annotation: 98 sp|Q91ZX7|LRP1_MOUSE 
