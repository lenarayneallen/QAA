### Pre-cutadapt bash commands

```bash
#Read 1 files
zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"

zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" -c #--> 27403


zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"

zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" -c #--> 161695

```



```bash
#Read 2 files
zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" 


zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" -c #--> 27686



zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"

zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" -c #--> 164539
```





### Post-cutadapt bash commands
```bash
cat /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/cutadapt_out_14_3B_control_R1.fastq | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" -c #--> 0
```

```bash
cat /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/cutadapt_out_14_3B_control_R2.fastq | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" -c #--> 0
```

```bash
cat /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/cutadapt_out_8_2F_fox_R1.fastq | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" -c #--> 0
```

```bash
cat /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/cutadapt_out_14_3B_control_R2.fastq | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" -c #--> 0-
```