#!/bin/bash

#SBATCH --job-name=rm_outlier_and_pca
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e rm_outlier_and_pca_%A_%a.err 
#SBATCH --time=72:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/plink/outliers_rm.txt --threads 8 -O v /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf 
module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf --plink --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 
module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm --pca --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 
gzip /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL 

module load pcangsd 
python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -threads 8 
#python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr2_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -threads 4 
#python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr3_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -threads 4 

module load angsd 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 2 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k2_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 3 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k3_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 4 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k4_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 5 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k5_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 6 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k6_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -K 7 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k7_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm -P 8 


#command to run: sbatch script_rm_outlier_and_pca.sh