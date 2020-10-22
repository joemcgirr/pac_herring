#!/bin/bash

#SBATCH --job-name=SS_rm_outlier_and_pca
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS_rm_outlier_and_pca_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/PCAngsd/outlier_rm/SS_outliers_rm.txt --threads 4 -O v /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf 
module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/split_pops/SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/split_pops/chr1_SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 
gzip /home/jamcgirr/ph/data/vcfs/split_pops/chr1_SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL 

module load pcangsd 
python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/split_pops/chr1_SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr1_SS_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -threads 4 


#command to run: sbatch script_SS_rm_outlier_and_pca.sh