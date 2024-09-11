# QAA - FastQC

# August 25th, 2024

### QAA environment and FASTQC installation:

- started interactive session:
    
    ```bash
    $ srun --account=bgmp --partition=bgmp --pty bash
    #srun: job 15875847 queued and waiting for resources
    #srun: job 15875847 has been allocated resources
    ```
    
- create QAA environment
    
    ```bash
    $ conda create -n QAA
    $ mamba activate QAA
    $ mamba install FastQC
    $ fastqc --version
    #FastQC v0.12.1
    
    ```
    

### running fastqc

- my datasets:
    - `14_3B_control_S10_L008`
        - 14_3B_control_S10_L008_R1_001.fastq.gz
        - 14_3B_control_S10_L008_R2_001.fastq.gz
    - `8_2F_fox_S7_L008`
        - 8_2F_fox_S7_L008_R1_001.fastq.gz
        - 8_2F_fox_S7_L008_R2_001.fastq.gz
- I initially did this in an interactive session and forgot to prepend /user/bin/time -v, so I will be unable to make comparisons about runtime/memory usage later on. I re-did it as shown below:

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz
#User time (seconds): 22.32
#System time (seconds): 0.98
#Percent of CPU this job got: 92%
#Maximum resident set size (kbytes): 188560
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz
#User time (seconds): 23.05
#System time (seconds): 1.14
#Percent of CPU this job got: 95%
#Maximum resident set size (kbytes): 169048
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz

#User time (seconds): 163.11
#System time (seconds): 6.81
#Percent of CPU this job got: 98%
#Maximum resident set size (kbytes): 191912
```

```bash
/usr/bin/time -v fastqc -o ./fastqc_results/ /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz
#User time (seconds): 170.41
#System time (seconds): 7.76
#Percent of CPU this job got: 99%
#Maximum resident set size (kbytes): 191452
```

# September 2nd, 2024

- These are located on my personal computer at: `~/bioinfo/Bi623/QAA`
    - plots:
    - htmls:

### running script from demultiplexing:

- copied `qs_dist.py` from /projects/bgmp/lenara/bioinfo/Bi622/demultiplexing
    - talapas location: `/projects/bgmp/lenara/bioinfo/Bi623/QAA/qs_dist/qs_dist.py`
    - edited argparse to output plots with the correct filename
- wrote slurm script to run on all four files:
    - QAA_qsDist.sh: `/projects/bgmp/lenara/bioinfo/Bi623/QAA/qs_dist/QAA_qsDist.sh`
    - slurm output: `slurm-15916970.out`
        
        ```
        # 14_3B_control_S10_L008_R1_001
        
        User time (seconds): 80.66
        System time (seconds): 0.24
        Percent of CPU this job got: 89%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 1:30.07
        Maximum resident set size (kbytes): 61284
        
        #14_3B_control_S10_L008_R2_001
        
        User time (seconds): 80.37
        System time (seconds): 0.17
        Percent of CPU this job got: 99%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 1:20.88
        Maximum resident set size (kbytes): 61152
        
        #8_2F_fox_S7_L008_R1_001
        
        User time (seconds): 638.09
        System time (seconds): 0.87
        Percent of CPU this job got: 99%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 10:41.24
        Maximum resident set size (kbytes): 61496
        
        #8_2F_fox_S7_L008_R2_001
        User time (seconds): 645.98
        System time (seconds): 0.94
        Percent of CPU this job got: 99%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 10:49.19
        Maximum resident set size (kbytes): 63296
        ```
        

### Installing cutadapt and trimmomatic:

```bash
$ srun --account=bgmp --partition=bgmp --pty bash
mamba activate QAA
mamba install cutadapt
cutadapt --version #--> 4.9

mamba install trimmomatic
trimmomatic -version #--> 0.39
```

cutadapt manual: [https://cutadapt.readthedocs.io/en/stable/index.html](https://cutadapt.readthedocs.io/en/stable/index.html)

![image.png](QAA%20-%20FastQC%20e537ea7812d14a9ba27011bf9d32f11d/image.png)

### predicting adaptors:

“universal illumina adaptor”

R1: `AGATCGGAAGAGCACACGTCTGAACTCCAGTCA`

R2: `AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT`

### Sanity check: checking for location/orientation of adaptor sequences in reads

- made markdown file with all code used to do this: `sanity_check_commands.md`
    - /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/sanity_check_commands.md

### Running cutadapt

- made directory for `cutadapt`: /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt
- wrote `cutadaptscript.sh` : /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/cutadaptscript.sh
- ran [`cutadaptscript.sh`](http://cutadaptscript.sh) :
    - job ID: 15932921
- output stats are in `slurm-15932921.out`
    - /projects/bgmp/lenara/bioinfo/Bi623/QAA/cutadapt/slurm-15932921.out
    - 14_3B_control_R1
        
        ![image.png](QAA%20-%20FastQC%20e537ea7812d14a9ba27011bf9d32f11d/image%201.png)
        
        ```
        User time (seconds): 8.91
                System time (seconds): 0.15
                Percent of CPU this job got: 63%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:14.27
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 28292
                Average resident set size (kbytes): 0
        ```
        
    - 14_3B_control_R2
        
        ![image.png](QAA%20-%20FastQC%20e537ea7812d14a9ba27011bf9d32f11d/image%202.png)
        
        ```
        User time (seconds): 9.51
                System time (seconds): 0.15
                Percent of CPU this job got: 92%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 0:10.47
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 32212
        ```
        
    - 8_2F_fox_R1
        
        ![image.png](QAA%20-%20FastQC%20e537ea7812d14a9ba27011bf9d32f11d/image%203.png)
        
        ```
        User time (seconds): 75.48
                System time (seconds): 0.86
                Percent of CPU this job got: 97%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 1:18.49
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 31036
        ```
        
    - 8_2F_fox_R2
        
        ![image.png](QAA%20-%20FastQC%20e537ea7812d14a9ba27011bf9d32f11d/image%204.png)
        
        ```
        User time (seconds): 76.04
                System time (seconds): 0.87
                Percent of CPU this job got: 97%
                Elapsed (wall clock) time (h:mm:ss or m:ss): 1:18.78
                Average shared text size (kbytes): 0
                Average unshared data size (kbytes): 0
                Average stack size (kbytes): 0
                Average total size (kbytes): 0
                Maximum resident set size (kbytes): 28744
        ```
        

# September 4th, 2024

### running trimmomatic

- make new directory for trimmomatic `/projects/bgmp/lenara/bioinfo/Bi623/QAA/trimmomatic`
- wrote slurm script to run trimmomatic:
    - [`trimmomatic.sh`](http://trimmomatic.sh) :
        - /projects/bgmp/lenara/bioinfo/Bi623/QAA/trimmomatic/trimmomaticscript.sh
- ran slurm script:
    - jobID: 15946270
    - node: n0352
    - slurm output file location: /projects/bgmp/lenara/bioinfo/Bi623/QAA/trimmomatic/slurm-15946270.out

# September 7th, 2024

### calculating length distribuitions

- wrote [`lendist.sh`](http://lendist.sh) script on talapas
    - /projects/bgmp/lenara/bioinfo/Bi623/QAA/trimmomatic/lendist.sh
- ran `lendist.sh`
    - slurm output file: /projects/bgmp/lenara/bioinfo/Bi623/QAA/trimmomatic/slurm-16030740.out
- scp’d output files to local

### Installing software for Part3:

- node: n0349

```bash
mamba activate QAA
mamba install star
mamba install numpy
mamba install matplotlib
mamba install htseq
mamba list

#Checking versions
#star                      2.7.11b
#matplotlib                3.9.2
#numpy                     1.26.4
#htseq                     2.0.5
```

### Creating star database:

- downloaded mouse primary assembly fasta from ensembl (112)
    - https://ftp.ensembl.org/pub/release-112/fasta/mus_musculus/dna/
    - `mus_musculus.GRCm29.dna.primary_assembly.fa.gz`
- made directory for STAR: `/projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR`
    - scp’d mouse fasta ant GTF from ensembl to this directory

# September 8th, 2024

### Running STAR:

- wrote slurm script:
    - `runstar.sh`: /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/runstar.sh
- ran `runstar.sh`:
    - jobID: 16037140
        - /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/slurm-16037140.out
    - main output files:
        - `143B_starAligned.out.sam`
            - /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/143B_starAligned.out.sam
        - `fox_starAligned.out.sam`
            - /projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR/fox_starAligned.out.sam

 

### Mapped and unmapped reads:

- copied script from ps8 into  `/projects/bgmp/lenara/bioinfo/Bi623/QAA/STAR`
- `mappedreads.py`
    - 14_3B_control
        - job id: `16038073`
        - output: `slurm-16038073.out`
        - mapped: 8312390
        - unmapped: 180914
    - fox
        - job id: 16038076
        - output: `slurm-16038076.out`
        - mapped: 67070894
        - unmapped: 2511420

### htseq-count

- made directory for htseq-count
    - /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count
- wrote two batch scripts:
    - `htseq_count_stranded.sh`
        - /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count/htseq_count_stranded.sh
        - `--stranded=yes`
        - jobid: 16038556
        - output files:
            - `fox_count_stranded_yes.txt`
            - `143B_count_stranded_yes.txt`
    - `htseq_count_rev.sh`
        - /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count/htseq_count_rev.sh
        - `--stranded=reverse`
        - jobid: 16038557
        - output files:
            - `fox_count_rev.txt`
            - `143B_count_rev.txt`
- percent mapped
    - formatted as bash script `mapped_unmapped.sh` at:  /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count/mapped_unmapped.sh
    - output:
        - `slurm-16123767.out`: /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count/slurm-16123767.out
        - renamed as `mapped_unmapped.out`: /projects/bgmp/lenara/bioinfo/Bi623/QAA/htseq-count/mapped_unmapped.out

```bash
#total mapped
cat fox_count_rev.txt | grep -v "__" | awk '{sum += $2}; END {print sum}'
#total
cat fox_count_rev.txt | awk '{sum += $2}; END {print sum}'

#total mapped
cat fox_count_stranded_yes.txt | grep -v "__" | awk '{sum += $2}; END {print sum}'
#total
cat fox_count_stranded_yes.txt | awk '{sum += $2}; END {print sum}'

#total mapped
cat 143B_count_rev.txt | grep -v "__" | awk '{sum += $2}; END {print sum}'
#total
cat 143B_count_rev.txt | awk '{sum += $2}; END {print sum}'

#total mapped
cat 143B_count_stranded_yes.txt | grep -v "__" | awk '{sum += $2}; END {print sum}'
#total
cat 143B_count_stranded_yes.txt | awk '{sum += $2}; END {print sum}'
```

|  | mapped | total | percentages |
| --- | --- | --- | --- |
| fox rev | 28037914 | 34791157 | 80.5 |
| fox str | 1205384 | 34791157 | 3.46 |
| 1493 rev | 3666607 | 4246652 | 86.34 |
| 1493 str | 161502 | 4246652 | 3.8 |

# FastQC Analysis brain dump/planning:

**per-tile sequence quality**

[“We would generally ignore errors which mildly affected a small number of tiles for only 1 or 2 cycles, but would pursue larger effects which showed high deviation in scores, or which persisted for several cycles.”](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/12%20Per%20Tile%20Sequence%20Quality.html)

**good for all:**

- per sequence quality score: R1 is better than R2, both are good, distribution is unimodal, extremely left skewed, meaning that most sequences have a high mean quality score
- per base seq content: rough at start for all files, but just due to the positional priming bias in the library preparation stages.
- don’t worry about duplication bc this is RNA seq

### FastQC report notes:

143B R1:

- per tile: okay, 2219 is bad. this can be removed in trimming, or entire tile can be removed.
- per sequence gc content is bad, but there are no jagged peaks that indicate contamination or dimers.

143B R2:

- per tile: 2201-2204 is bad

FOX R1:

- 2219 is bad again

FOX R2:

- per tile: 2201-2204 is bad
- overrepresented sequences:
    - CCTCACCCGGCCCGGACACGGACAGGATTGACAGATTGATAGCTCTTTCT
    - at 0.1007905%
    - “[This module will issue a warning if any sequence is found to represent more than 0.1% of the total.](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/9%20Overrepresented%20Sequences.html)”
    - could just be biologically significant