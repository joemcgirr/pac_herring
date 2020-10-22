#!/bin/bash

#SBATCH --job-name=trim_align_high_cov_ph
#SBATCH --mem=32G 
#SBATCH --ntasks=4 
#SBATCH -e trim_align_high_cov_ph_%A_%a.err 
#SBATCH --time=72:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# cp /home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R1_001.fastq.gz /home/jamcgirr/ph/data/hi_cov/ 
# cp /home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R2_001.fastq.gz /home/jamcgirr/ph/data/hi_cov/ 
#gzip -d /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R1_001.fastq.gz 
#gzip -d /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R2_001.fastq.gz 

# module load trim_galore 
# trim_galore -q 20 --paired --illumina /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R1_001.fastq /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R2_001.fastq 

# mv PH-Sitka-93_S1_L008_R1_001_val_1.fq /home/jamcgirr/ph/data/hi_cov 
# mv PH-Sitka-93_S1_L008_R2_001_val_2.fq /home/jamcgirr/ph/data/hi_cov 
# module load bwa
# bwa mem -aM -p -t 4 -R "@RG\tID:group1\tSM:PH-Sitka-93_S1_L008\tPL:illumina\tLB:lib1" /home/eoziolor/phpopg/data/genome_chr/c.harengus.fa /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R1_001_val_1.fq /home/jamcgirr/ph/data/hi_cov/PH-Sitka-93_S1_L008_R2_001_val_2.fq > /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sam 
module load samtools
# samtools view -Shu /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sam > /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.bam
# samtools index /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.bam
# rm /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sam 
samtools sort /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.bam -o /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.bam
samtools index /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.bam


#command to run: sbatch script_trim_align_high_cov_ph.sh