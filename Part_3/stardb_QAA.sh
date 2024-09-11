#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8


/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/STAR_db \
--genomeFastaFiles /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/Mus_musculus.GRCm39.112.gtf