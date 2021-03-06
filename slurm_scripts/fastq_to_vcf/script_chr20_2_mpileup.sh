#!/bin/bash

#SBATCH --job-name=chr20_2_mpileup
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e chr20_2_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr20:13347081-26694162 --threads 8 -Oz -o all_chr20_2.vcf.gz 
bcftools reheader -s samples.txt all_chr20_2.vcf.gz > allsites_chr20_2.vcf.gz  
rm all_chr20_2.vcf.gz 


#run: sbatch script_chr20_2_mpileup.sh