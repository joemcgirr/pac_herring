#!/bin/bash

#SBATCH --job-name=chr11_2_genotypegvcf_allsites
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e chr11_2_genotypegvcf_allsites_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk GenotypeGVCFs -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V gendb://chr11 -L chr11:15048164-30096327 -all-sites -O raw_variants_allsites_chr11_2.vcf 


#run: sbatch script_chr11_2_genotypegvcf_allsites.sh