#!/bin/bash

#SBATCH --job-name=PWS96_freqs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS96_freqs_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_PWS96_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz > /home/jamcgirr/ph/data/freqs/population_PWS96_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_freqs.txt 


#command to run: sbatch script_PWS96_freqs.sh