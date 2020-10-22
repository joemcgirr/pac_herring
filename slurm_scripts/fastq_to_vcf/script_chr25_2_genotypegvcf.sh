#!/bin/bash

#SBATCH --job-name=chr25_2_genotypegvcf
#SBATCH --mem=16G 
#SBATCH --ntasks=1 
#SBATCH -e chr25_2_genotypegvcf_%A_%a.err 
#SBATCH --time=06-00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk GenotypeGVCFs -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V gendb://chr25 -L chr25:7462096-14924191 -O raw_variants_chr25_2.vcf 


#command to run: sbatch script_chr25_2_genotypegvcf.sh