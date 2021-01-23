#!/bin/bash

#SBATCH --job-name=TB17_freqs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_freqs_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_TB17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz > /home/jamcgirr/ph/data/freqs/population_TB17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_freqs.txt 


#command to run: sbatch script_TB17_freqs.sh