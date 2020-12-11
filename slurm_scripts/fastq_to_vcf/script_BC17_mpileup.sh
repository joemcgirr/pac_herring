#!/bin/bash

#SBATCH --job-name=BC17_mpileup
#SBATCH --mem=8G 
#SBATCH --ntasks=24 
#SBATCH -e BC17_mpileup_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load samtools 
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/BC17_bams_p_1_5_rm.txt -I -a AD,DP,SP --threads 24 -Ob -o /home/jamcgirr/ph/data/mpileup/allsites_BC17.bcf 
bcftools call -m -Oz -f GQ,GP --threads 24 -o /home/jamcgirr/ph/data/mpileup/allsites_calls_BC17.vcf.gz /home/jamcgirr/ph/data/mpileup/allsites_BC17.bcf 


#run: sbatch script_BC17_mpileup.sh