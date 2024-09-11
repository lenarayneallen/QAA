#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp  

/usr/bin/time -v \
trimmomatic PE \
cutadapt_out_14_3B_control_R1.fastq cutadapt_out_14_3B_control_R2.fastq \
14_3B_control_R1.trimmed.fq.gz 14_3B_control_R1.un.trimmed.fq.gz \
14_3B_control_R2.trimmed.fq.gz 14_3B_control_R2.un.trimmed.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


/usr/bin/time -v \
trimmomatic PE \
cutadapt_out_8_2F_fox_R1.fastq cutadapt_out_8_2F_fox_R2.fastq \
8_2F_fox_R1.trimmed.fq.gz 8_2F_fox_R1.un.trimmed.fq.gz \
8_2F_fox_R2.trimmed.fq.gz 8_2F_fox_R2.un.trimmed.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

