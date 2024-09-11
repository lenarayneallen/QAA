#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp   


/usr/bin/time -v htseq-count --stranded=yes \
143B_starAligned.out.sam \
Mus_musculus.GRCm39.112.gtf > 143B_count_stranded_yes.txt

/usr/bin/time -v htseq-count --stranded=yes \
fox_starAligned.out.sam \
Mus_musculus.GRCm39.112.gtf > fox_count_stranded_yes.txt
