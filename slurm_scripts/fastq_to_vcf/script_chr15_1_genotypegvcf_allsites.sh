#!/bin/bash

#SBATCH --job-name=chr15_1_genotypegvcf_allsites
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e chr15_1_genotypegvcf_allsites_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk GenotypeGVCFs -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V gendb://chr15 -L chr15:1-14356761 -all-sites -O raw_variants_allsites_chr15_1.vcf 


#run: sbatch script_chr15_1_genotypegvcf_allsites.sh