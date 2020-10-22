#!/bin/bash

#SBATCH --job-name=remove_plate4_outliers
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e remove_plate4_outliers_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/plink/plate4_outliers_rm_no_TB.txt -O v /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB.vcf 
module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB.vcf --plink --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB 
module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB --pca --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB.vcf --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plate4_outliers_rm_no_TB.vcf 


#command to run: sbatch script_remove_plate4_outliers.sh