#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp                  
dir="/projects/bgmp/shared/2017_sequencing/demultiplexed/"

files="14_3B_control_S10_L008_R1_001.fastq.gz
14_3B_control_S10_L008_R2_001.fastq.gz
8_2F_fox_S7_L008_R1_001.fastq.gz
8_2F_fox_S7_L008_R2_001.fastq.gz"



for file in $files
do
    /usr/bin/time -v ./qs_dist.py -l 101 -f ${dir}$file -s $file
done

exit