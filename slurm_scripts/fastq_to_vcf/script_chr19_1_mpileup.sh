#!/bin/bash

#SBATCH --job-name=chr19_1_mpileup
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e chr19_1_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr19:1-13565322 --threads 8 -Oz -o all_chr19_1.vcf.gz 
bcftools reheader -s samples.txt all_chr19_1.vcf.gz > allsites_chr19_1.vcf.gz  
rm all_chr19_1.vcf.gz 


#run: sbatch script_chr19_1_mpileup.sh