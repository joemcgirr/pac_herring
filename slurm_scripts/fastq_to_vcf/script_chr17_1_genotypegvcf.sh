#!/bin/bash

#SBATCH --job-name=chr17_1_genotypegvcf
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e chr17_1_genotypegvcf_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk GenotypeGVCFs -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V gendb://chr17 -L chr17:1-13784255 -O raw_variants_chr17_1.vcf 


#run: sbatch script_chr17_1_genotypegvcf.sh