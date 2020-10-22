#!/bin/bash

#SBATCH --job-name=flagstat
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e flagstat_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -p med

module load samtools
samtools flagstat /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.bam > stats_PH_Sitka_93

#command to run: sbatch script_flagstat.sh