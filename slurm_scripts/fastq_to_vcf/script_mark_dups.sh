#!/bin/bash

#SBATCH --job-name=mark_dups
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e mark_dups_%A_%a.err 
#SBATCH --time=72:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load picardtools 
#picard-tools MarkDuplicates INPUT=/home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.bam OUTPUT=/home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam METRICS_FILE=/home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam.metrics.txt MAX_FILE_HANDLES=1000module load samtools 
samtools index /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam 



#command to run: sbatch script_mark_dups.sh