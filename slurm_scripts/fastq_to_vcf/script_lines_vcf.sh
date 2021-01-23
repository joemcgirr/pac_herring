#!/bin/bash

#SBATCH --job-name=lines_vcf
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e lines_vcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools view /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_outliers_rm.vcf.gz | wc -l > lines_vcf.txt


#command to run: sbatch script_lines_vcf.sh