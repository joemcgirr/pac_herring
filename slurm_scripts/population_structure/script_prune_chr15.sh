#!/bin/bash

#SBATCH --job-name=prune_chr15
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e prune_chr15_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -Ov --regions chr15 > /home/jamcgirr/ph/data/vcfs/chr15_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf 
java -jar /home/jamcgirr/apps/jvarkit/dist/downsamplevcf.jar -n 20000 /home/jamcgirr/ph/data/vcfs/chr15_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf > /home/jamcgirr/ph/data/vcfs/chr15_thin20k_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf 
module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/chr15_thin20k_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf --BEAGLE-PL --chr chr15 --out /home/jamcgirr/ph/data/vcfs/chr15_thin20k_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 


#command to run: sbatch script_prune_chr15.sh