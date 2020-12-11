#!/bin/bash

#SBATCH --job-name=chr26_1_mpileup
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e chr26_1_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr26:1-6221605 --threads 8 -Oz -o all_chr26_1.vcf.gz 
bcftools reheader -s samples.txt all_chr26_1.vcf.gz > allsites_chr26_1.vcf.gz  
rm all_chr26_1.vcf.gz 


#run: sbatch script_chr26_1_mpileup.sh