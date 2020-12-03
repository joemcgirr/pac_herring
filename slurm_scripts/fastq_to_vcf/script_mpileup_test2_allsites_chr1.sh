#!/bin/bash

#SBATCH --job-name=mpileup_test2_allsites_chr1
#SBATCH --mem=60G 
#SBATCH --ntasks=24
#SBATCH -e mpileup_test2_allsites_chr1_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
module load samtools
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -r chr1:1-100000 --threads 24 | bcftools call -m -Ov -f GQ,GP --threads 24 -o delete2_all_sites_chr1.vcf

#run: sbatch script_mpileup_test2_allsites_chr1.sh