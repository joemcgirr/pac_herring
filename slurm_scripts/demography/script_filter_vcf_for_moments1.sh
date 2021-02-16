#!/bin/bash

#SBATCH --job-name=filter_vcf_for_moments1
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e filter_vcf_for_moments1_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
module load bcftools
#bcftools filter -Oz --threads 4 -i 'INFO/DP>1300' /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz -o /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1300_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz 

bcftools query --threads 8 -f '%CHROM %POS %DP %NS\n' /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1300_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz > /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1300_maxDP2000_minQ20_minMQ30_NS0.5.depth 


#command to run: sbatch script_filter_vcf_for_moments1.sh