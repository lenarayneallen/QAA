# FastQC Commands

```
srun --account=bgmp --partition=bgmp --pty bash
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz
```