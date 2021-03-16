#!/bin/bash

#SBATCH --job-name=SS17_LD
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS17_LD_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load vcftools 
#vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --plink --out /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 

module load plink 
#plink --file /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 --indep-pairwise 100 10 0.8 --r2 --out /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_indep_pairwise_100_10_0.8 --threads 4 
plink --file /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 --r2 --out /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_r2 --threads 4 


#command to run: sbatch script_SS17_LD.sh