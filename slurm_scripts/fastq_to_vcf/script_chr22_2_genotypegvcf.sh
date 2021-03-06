#!/bin/bash

#SBATCH --job-name=chr22_2_genotypegvcf
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e chr22_2_genotypegvcf_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk GenotypeGVCFs -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V gendb://chr22 -L chr22:12832026-25664052 -O raw_variants_chr22_2.vcf 


#run: sbatch script_chr22_2_genotypegvcf.sh