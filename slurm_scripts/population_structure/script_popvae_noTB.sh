#!/bin/bash

#SBATCH --job-name=popvae_noTB
#SBATCH --mem=62G 
#SBATCH --ntasks=4 
#SBATCH -e popvae_noTB_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
#bcftools view -Oz /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -R /home/jamcgirr/ph/data/moments/ld_prune/ld_pruned_keep.txt --threads 4 > /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_ld_pruned.vcf.gz 
#bcftools view -Oz /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -R /home/jamcgirr/ph/data/moments/ld_prune/random_thin_keep.txt --threads 4 > /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_random_thin.vcf.gz 
bcftools view -S /home/jamcgirr/ph/data/popvae/plates_1_through_5_rm_no_TB.txt -Oz /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -R /home/jamcgirr/ph/data/moments/ld_prune/random_thin_keep.txt --threads 4 > /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_noTB_random_thin.vcf.gz 

source /home/jamcgirr/apps/my_python3.7/bin/activate

#popvae.py --infile /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_ld_pruned.vcf.gz --out /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_ld_pruned --seed 42
#popvae.py --infile /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_random_thin.vcf.gz --out /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_random_thin --seed 42
popvae.py --infile /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_noTB_random_thin.vcf.gz --out /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_noTB_random_thin --seed 42

#command to run: sbatch script_popvae_noTB.sh