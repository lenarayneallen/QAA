#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8


/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn  14_3B_control_R1.trimmed.fq.gz 14_3B_control_R2.trimmed.fq.gz \
--genomeDir /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/STAR_db/ \
--outFileNamePrefix 143B_star


/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn 8_2F_fox_R1.trimmed.fq.gz 8_2F_fox_R2.trimmed.fq.gz \
--genomeDir /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/STAR_db/ \
--outFileNamePrefix fox_star