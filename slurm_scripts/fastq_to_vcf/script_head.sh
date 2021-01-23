#!/bin/bash

#SBATCH --job-name=head
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e head_%A_%a.err 
#SBATCH --time=1:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools view /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz | head -100 > delete.txt



#run: sbatch script_head.sh