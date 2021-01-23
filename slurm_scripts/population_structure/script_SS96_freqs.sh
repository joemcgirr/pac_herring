#!/bin/bash

#SBATCH --job-name=SS96_freqs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_freqs_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools query -f '%CHROM %POS %AF\n' /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_SS96_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz > /home/jamcgirr/ph/data/freqs/population_SS96_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_freqs.txt 


#command to run: sbatch script_SS96_freqs.sh