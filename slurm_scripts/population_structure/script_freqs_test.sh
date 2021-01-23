#!/bin/bash

#SBATCH --job-name=freqs_test
#SBATCH --mem=8G 
#SBATCH --ntasks=4
#SBATCH -e freqs_test_%A_%a.err 
#SBATCH --time=8:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools
module load bcftools
#bcftools query -f '%CHROM %POS %AN %AC{0}\n' /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS07_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf > /home/jamcgirr/ph/data/freqs/PWS07_freqs_test.txt

bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS07_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf > /home/jamcgirr/ph/data/freqs/PWS07_freqs_test.txt
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf > /home/jamcgirr/ph/data/freqs/PWS91_freqs_test.txt
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf > /home/jamcgirr/ph/data/freqs/PWS96_freqs_test.txt
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf > /home/jamcgirr/ph/data/freqs/PWS17_freqs_test.txt

#run: sbatch script_freqs_test.sh