#!/bin/bash

#SBATCH --account=bgmp                    
#SBATCH --partition=bgmp   


/usr/bin/time -v htseq-count --stranded=reverse \
143B_starAligned.out.sam \
Mus_musculus.GRCm39.112.gtf > 143B_count_rev.txt

/usr/bin/time -v htseq-count --stranded=reverse \
fox_starAligned.out.sam \
Mus_musculus.GRCm39.112.gtf > fox_count_rev.txt