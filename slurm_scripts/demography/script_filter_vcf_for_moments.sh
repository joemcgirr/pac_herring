#!/bin/bash

#SBATCH --job-name=filter_vcf_for_moments
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e filter_vcf_for_moments_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools filter -Oz -i 'INFO/DP>1600 && INFO/NS>624' /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_ld0.1.vcf.gz -o /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1600_maxDP2000_minQ20_minMQ30_NS0.7_ld0.1.vcf.gz --threads 8 
bcftools index /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1600_maxDP2000_minQ20_minMQ30_NS0.7_ld0.1.vcf.gz 


#run: sbatch script_filter_vcf_for_moments.sh