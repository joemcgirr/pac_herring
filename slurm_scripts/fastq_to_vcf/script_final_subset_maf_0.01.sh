#!/bin/bash

#SBATCH --job-name=final_subset_maf_0.01
#SBATCH --mem=16G 
#SBATCH --ntasks=18 
#SBATCH -e final_subset_maf_0.01_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
##bcftools index /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf 
#bcftools view -R /home/jamcgirr/ph/data/combine_gvcfs/isec_test/sites.txt /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf -Oz > /home/jamcgirr/ph/data/combine_gvcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz 
#bcftools index /home/jamcgirr/ph/data/combine_gvcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz  
#bcftools filter -Oz --threads 8 -i 'INFO/AF>0.01' /home/jamcgirr/ph/data/combine_gvcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_threads.vcf.gz -o /home/jamcgirr/ph/data/combine_gvcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz  


#run: sbatch script_final_subset_maf_0.01.sh