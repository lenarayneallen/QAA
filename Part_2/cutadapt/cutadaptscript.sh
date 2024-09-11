#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp                  

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o cutadapt_out_14_3B_control_R1.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o cutadapt_out_14_3B_control_R2.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -o cutadapt_out_8_2F_fox_R1.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o cutadapt_out_8_2F_fox_R2.fastq /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz

