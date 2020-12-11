#!/bin/bash

#SBATCH --job-name=chr13_2_mpileup
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e chr13_2_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr13:14922870-29845739 --threads 8 -Oz -o all_chr13_2.vcf.gz 
bcftools reheader -s samples.txt all_chr13_2.vcf.gz > allsites_chr13_2.vcf.gz  
rm all_chr13_2.vcf.gz 


#run: sbatch script_chr13_2_mpileup.sh