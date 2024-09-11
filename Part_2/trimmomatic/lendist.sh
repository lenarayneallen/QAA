#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp

/usr/bin/time -v zcat 14_3B_control_R1.trimmed.fq.gz | grep "^@K00" -A1 | grep -v "^@" | grep -v "-" |awk '{print length($0)}'| sort -n -r | uniq -c > len_143B_R1.txt

/usr/bin/time -v zcat 14_3B_control_R2.trimmed.fq.gz | grep "^@K00" -A1 | grep -v "^@" | grep -v "-" |awk '{print length($0)}'| sort -n -r | uniq -c > len_143B_R2.txt

/usr/bin/time -v zcat 8_2F_fox_R1.trimmed.fq.gz | grep "^@K00" -A1 | grep -v "^@" | grep -v "-" |awk '{print length($0)}'| sort -n -r | uniq -c > len_fox_R1.txt

/usr/bin/time -v zcat 8_2F_fox_R2.trimmed.fq.gz | grep "^@K00" -A1 | grep -v "^@" | grep -v "-" |awk '{print length($0)}'| sort -n -r | uniq -c > len_fox_R2.txt