#!/bin/bash

#SBATCH --job-name=chr1_1_mpileup
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e chr1_1_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr1:1-16542129 --threads 8 -Ob -o allsites_chr1_1.bcf 
bcftools call -m -Oz -f GQ --threads 8 -o allsites_calls_chr1_1.vcf.gz allsites_chr1_1.bcf 


#run: sbatch script_chr1_1_mpileup.sh