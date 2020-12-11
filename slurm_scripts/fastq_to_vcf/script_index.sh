#!/bin/bash

#SBATCH --job-name=index
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e index_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
#bcftools index --threads 8 /home/jamcgirr/ph/data/mpileup/allsites_calls_BC17.vcf.gz
bcftools view -Oz --threads 8 -o /home/jamcgirr/ph/data/mpileup/allsites_BC17.vcf.gz /home/jamcgirr/ph/data/mpileup/allsites_BC17.bcf

#run: sbatch script_index.sh